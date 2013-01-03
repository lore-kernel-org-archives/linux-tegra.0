From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [v2 1/1] ARM: tegra: Make variables static
Date: Thu, 03 Jan 2013 09:43:11 -0700
Message-ID: <50E5B51F.7040605@wwwdotorg.org>
References: <50E482AF.6040607@wwwdotorg.org> <1357194425-18614-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357194425-18614-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/02/2013 11:27 PM, Hiroshi Doyu wrote:
> No need to be public. Checked with:
>   $ touch arch/arm/mach-tegra/*[ch] && make C=1

Applied to Tegra's for-3.9/cleanup branch.
