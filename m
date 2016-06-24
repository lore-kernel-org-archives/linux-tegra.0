From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH 2/2] Avoid man warning about unknown macro
Date: Fri, 24 Jun 2016 09:03:33 -0600
Message-ID: <576D4BC5.7020007@wwwdotorg.org>
References: <20160623185416.GA29091@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160623185416.GA29091-IRMp5PtgtdoigzW5ZibpNwC/G2K4zDHf@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/23/2016 12:54 PM, Martin Michlmayr wrote:
> man --warnings shows this warning because some dots at the beginning
> of the line are not escaped:
>
>> usr/share/man/man1/tegrarcm.1.gz 111: warning: macro `..' not defined
>
> Put the ellipsis in brackets to avoid this.
>
> This was found thanks to lintian, the Debian package checker.

Thanks, I've applied the series.
