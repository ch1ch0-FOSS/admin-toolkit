# Access, Roles & Sudo Best Practices

- All access is documented, reviewed quarterly.
- `sudo` access is audit-logged and restricted to the minimum set.
- No passwords in configs or scripts; SSH keys only.
- See onboarding.md for how to add new users securely.

| User/Role | Sudo | Group | Notes         |
|-----------|------|-------|---------------|
| admin     | yes  | wheel | Primary admin |
| devops    | yes  | wheel | Sec/DevOps AI |
