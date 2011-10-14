From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: Adding board support
Date: Fri, 14 Oct 2011 09:31:53 -0700
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF173BE1A290@HQMAIL01.nvidia.com>
References: <20111014054945.GA32399@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111014054945.GA32399-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry Reding wrote at Thursday, October 13, 2011 11:50 PM:
...
> I have a couple of questions, though. From what I can tell, the only
> functionality missing from mainline is nvmap/nvhost. While this is required
> for our boards, I was looking for some remote that includes support. The only
> source I came across was at git.chromium.org (kernel.git and
> kernel-next.git). I suppose those are kernels that are recommended to run on
> Tegra2 boards if HW-accelerated video decoding and 3D rendering is required,
> right?

There are also some NVIDIA kernel repos that contain this support; see:
http://nv-tegra.nvidia.com/gitweb/?p=linux-2.6.git;a=summary

I think our current Linux4Tegra releases do use the kernel from ChromeOS, but
future releases may move to our internal kernels.

> I guess for the time being, the best plan would be to work on two branches,
> one based on the code from chromium and one based on the mainline code which
> doesn't contain nvmap/nvhost and used to prepare patches for mainline. Which
> branch or repository should I base such work on? Olof's for-3.2 branches?

Just as an FYI, upstreaming nvmap/nvhost isn't a near-term goal. In the longer
term, we're starting to think about a solution here.

For practical purposes, you'll probably want to base any product kernels off
one of NVIDIA's various downstream branches. Given your Vibrante usage, it'd
probably be best to ask your existing NVIDIA contacts some of these questions.

However, please don't let that stop you upstreaming basic board support; you
should be able to upstream anything that doesn't depend on nvhost/nvmap etc.
You'll probably want to use device-tree exclusively for any new board support
in mainline.

> Another question concerns testing. So far I've always booted a modified
> U-Boot (from Vibrante 1.1) to allow booting with an initial ramdisk (loaded
> from SD/MMC) as payload for fastboot/quickboot. What are other people using?

Personally, I've recently switched to using mainline U-Boot on almost all my
boards (Harmony, Seaboard, Ventana). Maybe I'll add TrimSlice support there
too. Note that this relies on a number of patches that have been posted to
the U-Boot mailing list, but not yet checked into their repos. This completely
bypasses fastboot; Tegra's boot ROM runs U-Boot directly instead of fastboot.

> What tools should I be using to update the firmware? Unfortunately nvflash is
> not available in source code, and I haven't found any documentation about the
> early boot process, so it is kind of hard to figure out how all this is
> supposed to work and consequently find ways to automate these things for
> production boards.

Try grabbing the Linux4Tegra packages from:
http://developer.nvidia.com/content/linux-tegra-release-12-alpha-1-released

at least that has a publically obtainable/usable nvflash for a few boards.
You should be able to adjust the flash.cfg files there for other boards.

It's a little early to say much, but there are some early movements towards
replacing nvflash with something more open for general Linux usage. You may
also want to look at the "cbootimage" tool here:

https://gitorious.org/cbootimage

-- 
nvpublic
