# Completed infrastructure

Try not to look at these files unless you are really stuck. You'll learn best through trial and error.

## Important notes
The 'completed' Terraform is NOT Production ready. It has been created as an MVP to demonstrate the power of IaC.

Areas of known limitations:
- No HTTPS termination on the load balancer.
- No RDS administrative username and password automatic rotation.
- No RDS user was created specifically for WordPress access - it uses the admin user.
- The database is initialised by the EC2 - this wouldn't normally be the case. The database schema would be setup external to normally operating web servers.
- The NGINX configuration of the web servers is not hardened.
- The PHP configuration of the web servers is not hardened.
- WordPress plugins or themes across multiple servers will not work. Their content would need to be pulled into place onto each new web server that starts up.

Areas of improvement:
- CloudFront CDN
- Network ACLs
