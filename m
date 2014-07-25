From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH tegra-uboot-scripts v2] Make folder for dtb files as an
 argument
Date: Fri, 25 Jul 2014 10:05:55 -0600
Message-ID: <53D28063.5090909@wwwdotorg.org>
References: <aaa2e78cfda2a2afe91e9ac8dca4583e8a860123.1406238873.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <aaa2e78cfda2a2afe91e9ac8dca4583e8a860123.1406238873.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/24/2014 03:55 PM, Stefan Agner wrote:
> Some distribution use different folders to store the dtb files
> rather then storing them directly in /boot. This adds a new
> argument to define which folder U-Boot should search the dtb
> file.

> diff --git a/gen-uboot-script.py b/gen-uboot-script.py

> @@ -107,7 +110,10 @@ if args.type == 'net':
>       prefix=''
>   else:
>       load='load ${devtype} ${devnum}:${rootpart}'
> -    prefix='/boot/'
> +    if not args.dtbdir:
> +        prefix='/boot/'
> +    else:
> +        prefix=args.dtbdir+'/'
>
>   f.write(load + ' ${kernel_addr_r} ' + prefix + 'zImage\n')

I don't think this is right; it makes --dtbdir affect the value of the 
prefix variable, which is used for all of zImage, DTBs, and initrd. I 
didn't think that's what you wanted, although if it is, then (a) the 
option doesn't have the right name, and (b), it should presumably affect 
network mode too.
