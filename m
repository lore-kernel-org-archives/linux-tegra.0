From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/9] ARM: tegra: Add MIPI calibration DT entries for Tegra114
Date: Mon, 07 Oct 2013 15:16:11 -0600
Message-ID: <5253249B.6010008@wwwdotorg.org>
References: <1381146528-18069-1-git-send-email-treding@nvidia.com> <1381146528-18069-4-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381146528-18069-4-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/07/2013 05:48 AM, Thierry Reding wrote:
> Add a device node for the MIPI calibration block on Tegra114. There is
> no need to disable it by default because it only enables the clock while
> performing calibration and therefore shouldn't be consuming any power
> when unused.

>  include/dt-bindings/gpu/host1x/tegra114-mipi.h | 11 +++++++++++

Shouldn't that file be added in the same patch that defines the binding
that header contains constants for? What are those constants anyway?
