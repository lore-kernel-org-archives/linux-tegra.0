From: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Subject: Re: Linux hangs on Jetson TX1: Page fault (SMMU translation error
 [--S])
Date: Mon, 2 Jan 2017 17:03:17 -0800
Message-ID: <20170103010317.GA1373@jirafa.cyrius.com>
References: <20161218032759.GA6457@jirafa.cyrius.com>
 <20170102160844.GA18393@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20170102160844.GA18393-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

* Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> [2017-01-02 17:08]:
> Martin, one thing to check might be if your .config enables the
> TEGRA_IOMMU_SMMU option.

Yes, it's built-in.

I disabled TEGRA_IOMMU_SMMU (but left TEGRA_MC=y) and now I get:

[    6.556591] tegra-mc 70019000.memory-controller: gpusrd: read @0x0000000000000000: EMEM address decode error (EMEM decode error)
[    6.568158] tegra-mc 70019000.memory-controller: gpusrd: read @0x0000000000000000: Page fault (EMEM decode error)

Ok, this is interesting.  With both TEGRA_MC and TEGRA_IOMMU_SMMU
disabled, the boot process hangs.  Unfortunately I don't have time
to investigate more right now.

> Perhaps you can also regenerate a log with drm.debug=0x3f on the
> kernel command-line. Maybe throw in a NOUVEAU_DEBUG_DEFAULT=5 in
> .config to make sure Nouveau gives us as much info as possible (=7
> should give more, but it might be a little overkill).

Maybe I made a mistake, but I didn't get any more verbose logs with
drm.debug=0x3f and NOUVEAU_DEBUG_DEFAULT=5.

Let me know if you can reproduce the (original) problem.

-- 
Martin Michlmayr
http://www.cyrius.com/
