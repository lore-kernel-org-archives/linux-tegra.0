From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 1/2] ARM: tegra: modify Tegra30 USB2 default phy_type
 to UTMI
Date: Fri, 20 Dec 2013 09:52:30 -0700
Message-ID: <52B475CE.1000402@wwwdotorg.org>
References: <1387505333-3767-1-git-send-email-ebrower@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387505333-3767-1-git-send-email-ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/19/2013 07:08 PM, Eric Brower wrote:
> Modify Tegra30 default USB2 phy_type to UTMI; this matches
> power-on-reset defaults and is expected to be the common case.
> 
> The current implementation is likely an incorrect
> carry-over from Tegra20, where USB2 does default to ULPI.

The series, applied to Tegra's for-3.14/dt branch.
