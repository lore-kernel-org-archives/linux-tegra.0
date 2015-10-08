From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH v3 0/5] Add RSA signing support
Date: Thu, 8 Oct 2015 14:34:08 -0600
Message-ID: <5616D340.8070100@wwwdotorg.org>
References: <1444333109-3671-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444333109-3671-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/08/2015 01:38 PM, Jimmy Zhang wrote:
> 1. Address issues found in v2.
> 2. Use keyword "RehashBl" instead of "ReSignBl" to re-generate AES hash
>     for bootloader (and bct).
> 3. Add sample scripts to do rsa signing for T210 bootimage.

It's nice to have the changelog (also) in the individual patches so that 
it's easier for reviewers to track down where to look for changes.
