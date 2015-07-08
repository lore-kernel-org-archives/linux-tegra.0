From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH] tN: if_bct_is_tN_get_soc_config: Adds bounds
 checking to the BCT buffer.
Date: Wed, 08 Jul 2015 14:47:55 -0600
Message-ID: <559D8C7B.9020200@wwwdotorg.org>
References: <8A8A7455-57BF-4F37-B70B-B1A8F2E16326@me.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8A8A7455-57BF-4F37-B70B-B1A8F2E16326-BUHhN+a2lJ4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Giancarlo Canales <gcanalesb-BUHhN+a2lJ4@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/04/2015 06:03 PM, Giancarlo Canales wrote:
> Checks if the BCT buffer is too small to be a valid `nvboot_config_table`.

Can you please explain what problem this solves and how to trigger it? 
That explanation should probably be in the commit message too.
