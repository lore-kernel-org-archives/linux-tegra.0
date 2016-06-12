From: Shreshtha <shreshthakumar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: tegra-devfreq hangs TK1 with R21.4 u-boot
Date: Sun, 12 Jun 2016 17:15:32 +0000 (UTC)
Message-ID: <loom.20160612T175114-608@post.gmane.org>
References: <20160612034541.GA31426@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Martin Michlmayr <tbm@...> writes:

> 
> I noticed that the Jetson TK1 hangs during boot (when/before mounting
> the SD disk) when CONFIG_ARM_TEGRA_DEVFREQ=y is set and when u-boot
> from R21.4 is used (2014.10-rc2).

I cannot find CONFIG_ARM_TEGRA_DEVFREQ in r21.4 codeline. With default
"tegra12_defconfig", CONFIG_PM_DEVFREQ is getting enabled.

Can you please share some more details about CONFIG_ARM_TEGRA_DEVFREQ, which
file it complies and if it is really present in code or pulled from other git.
