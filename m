From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 06/11] tegrarcm: Assume nv3p server is running if RCM
 doesn't respond
Date: Mon, 09 Sep 2013 15:42:44 -0600
Message-ID: <522E40D4.5000206@wwwdotorg.org>
References: <1378757761-20939-1-git-send-email-amartin@nvidia.com> <1378757761-20939-7-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378757761-20939-7-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/09/2013 02:15 PM, Allen Martin wrote:
> Change the initialization logic so that if RCM protocol isn't
> repsonding but a tegra recovery USB is reported, assume the nv3p
> server is already running.  This allows things like enumeration of
> devices via nv3p without having to reset into RCM mode to talk to the
> device again.

> diff --git a/src/main.c b/src/main.c

>  
>  	return 0;
>  }
>  
> +
>  static int wait_status(nv3p_handle_t h3p)

Looks like a mistake.
