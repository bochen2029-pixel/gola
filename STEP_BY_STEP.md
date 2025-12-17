# 🎮 GOLA — Step-by-Step Setup Guide

## You will need:
- ✅ A GitHub account (free)
- ✅ Git installed on your computer
- ✅ About 10 minutes

---

# PART 1: Create GitHub Repository

## Step 1: Go to GitHub
Open your browser and go to:
```
https://github.com/new
```

## Step 2: Create the repository
Fill in these boxes:
- **Repository name:** `gola`
- **Description:** `GOLA v7.2 - OPO Simulation Game`
- **Public** ← Click this option
- ✅ Check "Add a README file"

Click the green **"Create repository"** button.

## Step 3: Copy your repo URL
On your new repo page, click the green **"Code"** button.
Copy the URL that looks like:
```
https://github.com/YOUR_USERNAME/gola.git
```

---

# PART 2: Upload the Files (Windows PowerShell)

## Step 4: Open PowerShell
Press `Win + X`, then click **"Windows Terminal"** or **"PowerShell"**

## Step 5: Go to your Documents folder
Type this and press Enter:
```powershell
cd ~\Documents
```

## Step 6: Clone your empty repo
Type this (replace YOUR_USERNAME with your GitHub username):
```powershell
git clone https://github.com/YOUR_USERNAME/gola.git
```

## Step 7: Go into the folder
```powershell
cd gola
```

## Step 8: Delete the auto-created README
```powershell
Remove-Item README.md
```

## Step 9: Download the GOLA files
I've packaged everything for you. Download and extract:
```powershell
# Create folder structure
New-Item -ItemType Directory -Path "frontend" -Force
New-Item -ItemType Directory -Path ".github\workflows" -Force
```

## Step 10: Copy your GOLA game file
Copy your `GOLA_v7_reality_checker.html` file to the `frontend` folder and rename it:
```powershell
Copy-Item "PATH_TO_YOUR_FILE\GOLA_v7_reality_checker.html" "frontend\index.html"
```

(Replace `PATH_TO_YOUR_FILE` with wherever you saved the HTML file)

## Step 11: Create the other files
You need to create these files in the `gola` folder. Open each one in Notepad and paste the content from the downloaded package:
- `Dockerfile`
- `docker-compose.yml`
- `nginx.conf`
- `install.ps1`
- `README.md`
- `.gitignore`
- `.dockerignore`
- `LICENSE`
- `.github/workflows/docker-publish.yml`

---

# PART 3: Push to GitHub

## Step 12: Add all files to Git
```powershell
git add .
```

## Step 13: Commit the files
```powershell
git commit -m "GOLA v7.2 - Initial upload"
```

## Step 14: Push to GitHub
```powershell
git push origin main
```

If asked for credentials, enter your GitHub username and a **Personal Access Token** (not your password).

---

# PART 4: Enable GitHub Actions & Packages

## Step 15: Go to your repo on GitHub
```
https://github.com/YOUR_USERNAME/gola
```

## Step 16: Check Actions are running
Click the **"Actions"** tab at the top.
You should see a workflow running (yellow circle) or completed (green checkmark).

## Step 17: Wait for the build
Wait about 2-3 minutes for the Docker image to build.
When you see a ✅ green checkmark, you're done!

## Step 18: Make the package public
1. Go to your GitHub profile page
2. Click **"Packages"** tab
3. Click on **"gola"**
4. Click **"Package settings"** (right side)
5. Scroll down to **"Danger Zone"**
6. Click **"Change visibility"**
7. Select **"Public"**
8. Type the package name to confirm
9. Click **"I understand, change package visibility"**

---

# PART 5: Update install.ps1

## Step 19: Edit install.ps1 on GitHub
1. Go to your repo: `https://github.com/YOUR_USERNAME/gola`
2. Click on `install.ps1`
3. Click the ✏️ pencil icon (Edit)
4. Find this line:
   ```
   $IMAGE_NAME = "ghcr.io/YOUR_USERNAME/gola:latest"
   ```
5. Replace `YOUR_USERNAME` with your actual GitHub username
6. Click **"Commit changes"**

## Step 20: Also update README.md
Do the same for README.md — replace all `YOUR_USERNAME` with your actual username.

---

# 🎉 DONE! Share with Others

Now anyone can play your game with ONE command:

```powershell
irm https://raw.githubusercontent.com/YOUR_USERNAME/gola/main/install.ps1 | iex
```

Or manually:
```powershell
docker run -d -p 8080:8080 ghcr.io/YOUR_USERNAME/gola:latest
Start-Process "http://localhost:8080"
```

---

# ❓ Troubleshooting

## "Permission denied" when pushing
→ You need a Personal Access Token:
1. Go to: https://github.com/settings/tokens
2. Click "Generate new token (classic)"
3. Check: `repo`, `write:packages`, `read:packages`
4. Copy the token
5. Use it as your password when pushing

## "Package not found" when running
→ Make sure you made the package public (Step 18)

## "Docker not found"
→ Install Docker Desktop: https://www.docker.com/products/docker-desktop/

## Action failed with "unauthorized"
→ This is normal for the first push. Go to Actions, click the failed workflow, click "Re-run all jobs"

---

# 📝 Quick Reference

| What | Where |
|------|-------|
| Your repo | `https://github.com/YOUR_USERNAME/gola` |
| Docker image | `ghcr.io/YOUR_USERNAME/gola:latest` |
| Raw install script | `https://raw.githubusercontent.com/YOUR_USERNAME/gola/main/install.ps1` |
| Game running at | `http://localhost:8080` |
