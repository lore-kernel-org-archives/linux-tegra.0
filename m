From: Antti P Miettinen <ananaza-X3B1VOXEql0@public.gmane.org>
Subject: Re: [PATCH 3/7] ARM: tegra30: cpuidle: add LP2 driver for secondary CPUs
Date: Tue, 09 Oct 2012 18:55:47 +0300
Message-ID: <87pq4rej24.fsf@amiettinen-lnx.nvidia.com>
References: <1349691981-31038-1-git-send-email-josephl@nvidia.com>
	<1349691981-31038-4-git-send-email-josephl@nvidia.com>
	<20121008163504.GC5377@e102568-lin.cambridge.arm.com>
	<1349755995.15153.145.camel@jlo-ubuntu-64.nvidia.com>
	<20121009083804.GA11840@e102568-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
writes:
>> For CPU0:
>> * outer_disable (flush and disable L2)
>
> I guess L2 cannot be retained on Tegra ?

The L2 RAM is in different power domain and we do want to retain it. The
code Joseph is currently working on uses the generic outer_disable()
which will flush the L2 but eventually we want to avoid that. To
maintain coherence (and developer sanity :-) this really requires moving
the L2 disable after MMU disable and similarly moving the L2 enable
before MMU enable (keeps L2 available for TLB fetches).

        --Antti
