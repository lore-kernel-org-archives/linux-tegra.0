From: Hiroshi Doyu <hdoyu@nvidia.com>
Subject: Re: [v3 2/2] ARM: tegra: Skip scu_enable(scu_base) if not Cortex A9
Date: Wed, 23 Jan 2013 10:27:45 +0100
Message-ID: <20130123.112745.1104072242042163713.hdoyu@nvidia.com>
References: <50FE2CA8.20100@ti.com><50FEC503.2080602@wwwdotorg.org><20130123.080457.171573168772211248.hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130123.080457.171573168772211248.hdoyu@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>
Cc: "santosh.shilimkar@ti.com" <santosh.shilimkar@ti.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "arnd@arndb.de" <arnd@arndb.de>, "olof@lixom.net" <olof@lixom.net>, "linux@arm.linux.org.uk" <linux@arm.linux.org.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Hiroshi Doyu <hdoyu@nvidia.com> wrote @ Wed, 23 Jan 2013 08:04:57 +0200 (EET):

> Stephen Warren <swarren@wwwdotorg.org> wrote @ Tue, 22 Jan 2013 17:57:39 +0100:
> 
> > Hiroshi, is this series the only dependency you need for your
> > Tegra114
> 
> Basically yes.
> 
> > series? So, I could merge your Tegra114 series once this series is applied?
> 
> But now "CCF" seems to be in. Then, the HACK(*1) needs to be replaced
> with "Tegra114 CCF". But "Tegra114 CCF" doesn't seem ready yet. I'll check
> if this Tegra114 series would work without "Tegra114 CCF".
> 
> *1: http://patchwork.ozlabs.org/patch/212010/

Stephen,

Verified "Tegra114 series" worked with "for-3.9/soc" branch(inc CCF)
with a little tweak.

I can post Tegra114 series again. If you want them rebased onto
another branch, let me know.
