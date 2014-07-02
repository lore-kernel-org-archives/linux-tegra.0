From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [flasher PATCH 1/2] Switch flasher script to subprocess
Date: Wed, 02 Jul 2014 17:18:53 -0600
Message-ID: <53B4935D.8040504@wwwdotorg.org>
References: <1404322363-11580-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404322363-11580-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/02/2014 11:32 AM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This avoids any issues re: quoting the commands we execute, such as
> fdtput to modify the DTB sent to the flashing process.
> 
> The build script already uses subprocess, so this doesn't introduce any
> new dependencies overall.

I've applied the series, with the typo in patch 2's commit description
fixed.
