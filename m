From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 0/3] Tegra i2c board changes + defconfig update
Date: Mon,  7 Mar 2011 02:26:36 -0600
Message-ID: <1299486399-21761-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi,

Here is a short series of i2c patches to configure the i2c-tegra driver
for the boards in the tree, and to register some of the devices.

It also includes a defconfig update that enables the new drivers, enables
TRIMSLICE by default since the pcie fix makes it possible and also turns
on a few more config options that are useful (i.e. EFI partition tables
and some common board devices).

Since these patches rely on drivers that will be merged during the
upcoming window, this is my plan:

* Check them into boards-for-next together with Stephen W's
  other late-merge board patches in a day or two
* Ask sfr to add said branch to linux-next (towards the end of list of trees)
* Sit on them until merge window is open and base tegra, i2c and asoc have
  all been merged
* Rebase to current upstream when said trees are in, let it sit for 1
  day for a linux-next cycle for sanity-check
* Send pull request


-Olof


--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
