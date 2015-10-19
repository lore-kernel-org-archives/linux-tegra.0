From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH v7 0/5] Add RSA signing support
Date: Mon, 19 Oct 2015 17:47:11 -0600
Message-ID: <562580FF.5000908@wwwdotorg.org>
References: <1445295718-19146-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1445295718-19146-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/19/2015 05:01 PM, Jimmy Zhang wrote:
> V7:
> 1 Redefine parameter "u_int8_t *in" as "const u_int8_t *in" for function
>     reverse_byte_order()
> 2 Clean up compiler warnings from nvbctlib_t210.c

I've applied this series, and pushed it and a new tag to github.

(I edited the commit descriptions to remove the changelog from them; it 
should go below the --- line)
