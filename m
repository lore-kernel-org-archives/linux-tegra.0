From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH 0/2] Add T132 support
Date: Wed, 14 Jan 2015 10:03:33 -0700
Message-ID: <54B6A165.8090001@wwwdotorg.org>
References: <1421194802-28198-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1421194802-28198-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/13/2015 05:20 PM, Jimmy Zhang wrote:
> Allen originally started T132 supporting patches under branch dev/amartin/t132-dev.
> Recently I added more changes on top of his works. Since Allen is tied with other
> project, I was assigned to update and upstream all Allen's patches as well as my
> changes.

I'm going to hold off reviewing this until we've resolved our internal 
discussion re: how (where) to distribute the MTS firmware.

BTW, since this is an updated version of the series, you should:

a) Put "V2" in the email subjects (git format-patch 
--subject-prefix="PATCH V2").

b) Include a description of what changed between the versions. That allows:

* People to understand why V2 was posted.

* Someone who has already reviewed V1 toconcentrate their re-review on 
just the differences.
