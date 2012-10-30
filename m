From: Antti P Miettinen <ananaza-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH 3/7] ARM: tegra30: cpuidle: add LP2 driver for secondary CPUs
Date: Wed, 31 Oct 2012 00:03:48 +0200
Message-ID: <87sj8vr517.fsf@amiettinen-lnx.nvidia.com>
References: <1349691981-31038-1-git-send-email-josephl@nvidia.com>
	<1349691981-31038-4-git-send-email-josephl@nvidia.com>
	<5074A74A.8010803@wwwdotorg.org>
	<1349946918.19413.130.camel@jlo-ubuntu-64.nvidia.com>
	<5076F2AE.6030509@wwwdotorg.org>
	<1350012099.20241.10.camel@jlo-ubuntu-64.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> writes:
>> >>> +	writel(tegra_in_lp2.bits[0], tegra_cpu_lp2_mask);

BTW, writel_relaxed() would probably be more than enough? IRAM is mapped
stronly ordered, isn't it? And there's an explicit dsb(). And the mask
is observed and written only by CPUs. If there are coherence issues,
they would be in the fabric? And then neither CPU barriers nor L2 sync
would help, you'd need a readback, right?

--
Antti P Miettinen
http://www.iki.fi/~ananaza/
