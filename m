From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH] bct_dump: don't crash on devices without RSA
 support
Date: Fri, 29 Jul 2016 10:07:55 -0600
Message-ID: <ef293885-1c0e-6c91-ae65-8312605b4528@wwwdotorg.org>
References: <20160728174405.16136-1-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160728174405.16136-1-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/28/2016 11:44 AM, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> format_rsa_param() currently crashes on chips that don't implement
> soc_config->get_value_size(); that is, on all chips before T124. Fix the
> function not to crash. Better might be to avoid even dumping RSA
> parameters on chips which don't support RSA, but that's a larger change
> that needs much more work.
>
> Fixes: 3c3b992a6814 ("Add support to dump rsa related fields for t210")
> Cc: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

I've applied this.
