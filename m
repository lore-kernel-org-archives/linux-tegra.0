From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage-configs PATCH] Update colibri_t30 BCT to use all
 SDRAM entries
Date: Wed, 06 Aug 2014 10:12:27 -0600
Message-ID: <53E253EB.1050104@wwwdotorg.org>
References: <1407311217-1742-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407311217-1742-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/06/2014 01:46 AM, Stefan Agner wrote:
> Use all SDRAM entries to make sure in any case a valid configuration
> is selected.

I've applied this.

I would have expected the COM itself to define the SDRAM straps, and 
hence only SDRAM configuration 0 would ever be used. Still, this patch 
is fine either way.
