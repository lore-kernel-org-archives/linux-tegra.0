From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage-configs PATCH] Rename colibri-t30 BCT files to colibri_t30
Date: Wed, 06 Aug 2014 10:08:35 -0600
Message-ID: <53E25303.20105@wwwdotorg.org>
References: <1407275471-18567-1-git-send-email-stefan@agner.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407275471-18567-1-git-send-email-stefan-XLVq0VzYD2Y@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>, twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org, dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/05/2014 03:51 PM, Stefan Agner wrote:
> This renaming aligns the board name to the U-Boot board name.

I've applied this.

It would be useful if you pass -M to "git format-patch", so that pure 
renames are detected. That makes it much easier to verify that this 
patch does nothing but rename files. In the version you sent, the 
renames were sent as deletes/adds, which is much more to read and verify.

(Luckily, applying this, then running "git format-patch -1 -M" let me 
verify it without too much difficulty)
