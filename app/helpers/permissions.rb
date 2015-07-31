class Permissions
  #handles permission methods
  #if camel-cased (e.g. bothManagers), then returns a permission hash
  #if underscore seperated (e.g. both_managers), then returns a boolean

	def self.is_at_least_manager(user)
		return (user.role == "manager" or user.role == 'owner')
  end

  def self.both_managers(current_user, other_user)
    return (current_user.role == "manager") && (other_user.role == "manager")
  end

  #returns a hash {:has_permission => boolean, :permission_message => string}
  def self.hasOwnerPermissions(current_user)
    perm_hash = {:has_permission => false, :permission_message => "something went wrong while trying to verify permission"}
    is_owner = (current_user.role == "owner")
    if !is_owner
      perm_hash[:has_permission] = false
      perm_hash[:permission_message] = "Not logged in as owner"
    else
      perm_hash[:has_permission] = true
      perm_hash[:permission_message] = "Logged in as owner"
    end
  end

  #returns a hash {:has_permission => boolean, :permission_message => string}
  def self.hasAtLeastManagerPermissions(current_user)
    perm_hash = {:has_permission => false, :permission_message => "something went wrong while trying to verify permission"}
    is_manager = (current_user.role == "manager")
    if !is_manager
      is_owner = current_user.role == "owner"
      if !is_owner
        perm_hash[:has_permission] = false
        perm_hash[:permission_message] = "Make sure you're logged in as an owner or manager"
      else
        perm_hash[:has_permission] = true
        perm_hash[:permission_message] = "Logged in as owner"
      end
    else
      perm_hash[:has_permission] = true
      perm_hash[:permission_message] = "Logged in as manager"
    end

    return perm_hash
  end

  #returns a hash{:has_permissions => boolean, :permission_message => string}
  def self.hasMorePermissions(current_user,other_user)
    perm_hash = {:has_permission => false, :permission_message => "something went wrong while trying to verify permission"}

    current_is_owner = (current_user.role == "owner")
    if !current_is_owner
      current_is_manager = (current_user.role == "manager")
      if !current_is_manager
        perm_hash[:has_permission] = false
        perm_hash[:permission_message] = "Staff can't change any other employee"
      else
        #current_is_manager
        other_is_staff = (other_user.role == "staff")
        if other_is_staff
          perm_hash[:has_permission] = true
          perm_hash[:permission_message] = "Managers can change any staff"
        else
          perm_hash[:has_permission] = false
          perm_hash[:permission_message] = "Managers can't change other managers or owners"
        end
      end
    else
      other_is_owner = (other_user.role == "owner")
      if other_is_owner
        perm_hash[:has_permission] = false
        perm_hash[:permission_message] = "Can't change another owner"
      else
        perm_hash[:has_permission] = true
        perm_hash[:permission_message] = "Owners can change any employee"
      end
    end

    return perm_hash
  end

  #returns a hash{:has_permissions => boolean, :permission_message => string}
  def self.currentLoggedInOrHasMorePermissions(current_user, other_user)
    perm_hash = {:has_permission => false, :permission_message => "something went wrong while trying to verify permission"}
    same_user = current_user.id == other_user.id
    if !same_user
      current_is_owner = (current_user.role == "owner")
      if !current_is_owner
        current_is_manager = (current_user.role == "manager")
        if !current_is_manager
          perm_hash[:has_permission] = false
          perm_hash[:permission_message] = "Staff can't change any other employee"
        else
          #current_is_manager
          other_is_staff = (other_user.role == "staff")
          if other_is_staff
            perm_hash[:has_permission] = true
            perm_hash[:permission_message] = "Managers can change any staff"
          else
            perm_hash[:has_permission] = false
            perm_hash[:permission_message] = "Managers can't change other manager's or owners"
          end
        end
      else
        other_is_owner = (other_user.role == "owner")
        if other_is_owner
          perm_hash[:has_permission] = false
          perm_hash[:permission_message] = "Can't change another owner"
        else
          perm_hash[:has_permission] = true
          perm_hash[:permission_message] = "Owners can change any employee"
        end
      end

    else
      perm_hash[:has_permission] = true
      perm_hash[:permission_message] = "Can change self"
    end

    return perm_hash
  end

  #returns a hash {:has_permission => boolean, :permission_message => string}
  def self.currentLoggedInOrHasAtLeastManagerPermissions(current_user,user)
    perm_hash = {:has_permission => false, :permission_message => "something went wrong while trying to verify permission"}
    same_user = current_user.id == user.id
    if !same_user
      is_manager = (current_user.role == "manager")
      if !is_manager
        is_owner = current_user.role == "owner"
        if !is_owner
          perm_hash[:has_permission] = false
          perm_hash[:permission_message] = "Make sure you're logged in as correct user or are an owner or manager"
        else
          perm_hash[:has_permission] = true
          perm_hash[:permission_message] = "Logged in as owner"
        end
      else
        perm_hash[:has_permission] = true
        perm_hash[:permission_message] = "Logged in as manager"
      end

    else
      perm_hash[:has_permission] = true
      perm_hash[:permission_message] = "Is logged in as self"
    end

    return perm_hash

  end

end
