From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [flasher PATCH] Add support for colibri_t30
Date: Wed, 06 Aug 2014 10:20:19 -0600
Message-ID: <53E255C3.4020908@wwwdotorg.org>
References: <1407275875-18722-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407275875-18722-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/05/2014 03:57 PM, Stefan Agner wrote:
> This commit adds support for the Toradex Colibri T30 module. Since
> we use the same boot loader for all carrier board, in the boot
> loader world (U-Boot/BCT) the board name consists of the module
> name only, without any reference to the carrier board.

I've applied this too.

I disabled the board by default, so the "./build build" won't build it, 
but "./build --boards colibri_t30 build" will. This is because mainline 
U-Boot doesn't yet have support for this build, so including it in the 
default build would prevent the default build from succeeding. We can 
remove that flag once U-Boot support makes it into the mainline U-Boot repo.
