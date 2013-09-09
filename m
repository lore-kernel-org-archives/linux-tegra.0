From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 10/11] tegrarcm: Add command to pass miniloader in from
 file
Date: Mon, 09 Sep 2013 15:56:39 -0600
Message-ID: <522E4417.3050702@wwwdotorg.org>
References: <1378757761-20939-1-git-send-email-amartin@nvidia.com> <1378757761-20939-11-git-send-email-amartin@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378757761-20939-11-git-send-email-amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/09/2013 02:16 PM, Allen Martin wrote:
> Add --miniloader and --miniloader_entry commands which allow passing
> in the miniloader from a file and specifying the miniloader entry
> address from the command line instead of using built-in miniloader.

> @@ -371,11 +431,9 @@ static int initialize_rcm(uint16_t devid, usb_device_t *usb)
>  		return ret;
>  	}
>  	printf("miniloader downloaded successfully\n");
> -
>  	return 0;
>  }

Note sure if you want to remove that blank line.

>  
> -
>  static int wait_status(nv3p_handle_t h3p)

Ah, I guess the fix for my earlier comment went into the wrong patch:-)
