From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH tegra-uboot-scripts v3] Make folder for dtb files as an
 argument
Date: Mon, 28 Jul 2014 15:33:29 -0600
Message-ID: <53D6C1A9.9030608@wwwdotorg.org>
References: <463bd9459319d174d315a31eba4dc24daf03c0c3.1406576139.git.stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <463bd9459319d174d315a31eba4dc24daf03c0c3.1406576139.git.stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 07/28/2014 01:40 PM, Stefan Agner wrote:
> Some distribution use different folders to store the dtb files
> rather then storing them directly in /boot. This adds a new
> argument to define in which folder U-Boot should search the dtb
> file.

Applied.

> diff --git a/gen-uboot-script.py b/gen-uboot-script.py

> +if not args.dtbdir:
> +    args.dtbdir = prefix
> +elif args.dtbdir[-1:] != '/':

I converted that to use .endswith() to avoid open-coding.
