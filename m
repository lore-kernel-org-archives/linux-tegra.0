From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra DRM on AC100
Date: Thu, 25 Oct 2012 15:35:39 +0800
Message-ID: <5088EBCB.7030600@nvidia.com>
References: <1351108489.16610.8.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1351108489.16610.8.camel-bi+AKbBUZKY6gyzm1THtWbp2dZbC/Bob@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Meyer <thomas-VsYtu1Qij5c@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi, Thomas:

Your "config-arm" says the drm driver was built as a kernel module.
So did you try to run "modprobe tegra-drm" after system booted?
Or, I suggest you can change the drm driver to be built into kernel 
while not be built as a module. In Thierry's kernel config, drm driver 
is built as a module, this is good for debugging but may not be 
convenient for users.

In addition, are you sure you have enabled the backlight?

Mark
On 10/25/2012 03:54 AM, Thomas Meyer wrote:
> Hi,
>
> I'm trying to run Thierry's latest linux kernel
> (git://gitorious.org/thierryreding/linux.git branch: tegra/next commit:
> 1633170) which contains the Tegra DRM driver on my AC100, but without
> success.
>
> I did these steps:
> 1.) Patch kernel with attached patches. One patch is to support the
> native AC100 partition scheme, the other one is for the device tree.
>
> 2.) Compile the kernel with the attached boot config.
> 3.) attach the compiled device-tree file to the zImage via "cat zImage
> tegra20-paz00 > zImage".
> 4.) Use abootimg to create an android boot loader file
>
> After a reboot all I get is a blank screen, no messages, no errors,
> nothing. Sadly this device has no serial port, so any help is
> appreciated!
>
> What am I missing/doing wrong?
>
> with kind regards
> thomas
>
>
>
