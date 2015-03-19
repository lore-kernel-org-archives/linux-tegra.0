From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH v1 4/8] tegrarcm: add support for odmdata command
Date: Thu, 19 Mar 2015 13:37:00 -0600
Message-ID: <550B255C.5040609@wwwdotorg.org>
References: <1426639141-12060-1-git-send-email-jimmzhang@nvidia.com> <1426639141-12060-6-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426639141-12060-6-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 03/17/2015 06:38 PM, Jimmy Zhang wrote:
> From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Add "--odmdata=[odmdata]" option in command line.

Typically the ODMDATA value is expected to be part of the BCT. What's 
the use-case for providing it via tegrarcm; why not just fix the BCT to 
contain the correct value?
