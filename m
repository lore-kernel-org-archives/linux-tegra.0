From: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Subject: nouveau: DRM: failed to create ce channel, -22 on Jetson TK1
Date: Wed, 22 Jun 2016 20:59:13 -0700
Message-ID: <20160623035913.GA22402@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

I see the following on a Jetson TK1:

[    9.495425] [TTM] Initializing DMA pool allocator
[    9.495513] nouveau 57000000.gpu: DRM: VRAM: 0 MiB
[    9.495520] nouveau 57000000.gpu: DRM: GART: 1048576 MiB
[    9.508076] nouveau 57000000.gpu: DRM: failed to create ce channel, -22

A Google search suggests that I'm not the only one with this, but I
don't see it being discussed anywhere.

Is this known / expected?

This is with 4.6 and 4.7-rc4.  The firmware is installed.

-- 
Martin Michlmayr
http://www.cyrius.com/
