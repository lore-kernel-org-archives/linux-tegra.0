From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 5/9] ARM: tegra: Add Tegra114 DSI support
Date: Mon, 07 Oct 2013 15:21:06 -0600
Message-ID: <525325C2.10107@wwwdotorg.org>
References: <1381146528-18069-1-git-send-email-treding@nvidia.com> <1381146528-18069-6-git-send-email-treding@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381146528-18069-6-git-send-email-treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/07/2013 05:48 AM, Thierry Reding wrote:
> Add device tree nodes for the DSI controllers found on Tegra114 SoCs.

Why not squash patches 3, 4, 5 together, since they're all just adding a
bunch of similar things to the same DT file?
