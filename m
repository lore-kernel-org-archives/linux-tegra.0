From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] dts: tegra-ventana: use proper root instead of /dev/ram
Date: Mon, 14 Nov 2011 08:49:54 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF1740805A99@HQMAIL01.nvidia.com>
References: <1321251032-5461-1-git-send-email-vwadekar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1321251032-5461-1-git-send-email-vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "Colin Cross (ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org)" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Varun Wadekar wrote at Sunday, November 13, 2011 11:11 PM:
> the root file system on ventana resides on /dev/mmcblk0p1.

"The" should be capitalized.

> update the dts file to use the proper root instead of /dev/ram.
> 
> Original-author: Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

If Pritesh did write this, and you didn't significantly rewrite it, you
should probably re-send this after fixing the authorship information in
git; that way "git format-patch" will emit a "From" line with Pritesh's
information into the email body, so that the author field is set correctly
when this is merged. Assuming this is the most recent commit in your branch,
you'd do:

git commit --amend --author='Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>'

(although I also wonder why Pritesh didn't sign it off)

The content of the patch seems fine to me.

-- 
nvpublic
