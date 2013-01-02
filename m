From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/1] ARM: tegra: Make variables static
Date: Wed, 02 Jan 2013 11:55:43 -0700
Message-ID: <50E482AF.6040607@wwwdotorg.org>
References: <50B3C36D.9030501@wwwdotorg.org> <1354000514-29159-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1354000514-29159-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/27/2012 12:15 AM, Hiroshi Doyu wrote:
> No need to be public. Checked with:
>   $ touch arch/arm/mach-tegra/*[ch] && make C=1

Horoshi, this patch doesn't apply to Tegra's for-3.9/cleanup branch
(which is basically v3.8-rc1). Can you please rebase and repost?
