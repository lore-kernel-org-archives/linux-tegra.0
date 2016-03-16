From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] Manual page cleanups and expansion
Date: Wed, 16 Mar 2016 10:34:41 -0600
Message-ID: <56E98B21.2050303@wwwdotorg.org>
References: <1458062687-12876-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1458062687-12876-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 03/15/2016 11:24 AM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Expand documentation of --pkc, --gen-signed-msgs, and
> --download-signed-msgs.
>
> Clean up various capitalization issues.
>
> Fix a typo, in the code too.

> diff --git a/src/tegrarcm.1.in b/src/tegrarcm.1.in

> +Both of these steps require use of the \-\-gen\-signed\-msgs option to indicate

I fixed "\-\-gen\-signed\-msgs" to be "\-\-signed\-msgs\-file" and have 
applied this. I'll push in a second.
