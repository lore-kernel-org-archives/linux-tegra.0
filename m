From: Manish Badarkhe <badarkhe.manish-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] regulator: tps65090: remove usage of IS_ERR_OR_NULL
Date: Tue, 1 Oct 2013 20:29:19 +0530
Message-ID: <CAKDJKT6kBi_axtn+qDBkwueRGn_zzOAdSstRF=x1OqX-TrO2XQ@mail.gmail.com>
References: <1380600664-20649-1-git-send-email-badarkhe.manish@gmail.com>
	<20131001092258.GJ19304@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131001092258.GJ19304-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Mark,

Thank you for your reply.

On Tue, Oct 1, 2013 at 2:52 PM, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> On Tue, Oct 01, 2013 at 09:41:04AM +0530, Manish Badarkhe wrote:
>> This patch changes the driver to avoid the usage of IS_ERR_OR_NULL()
>> macro.
>
> Why?

Code use "IS_ERR_OR_NULL()" properly as per current implementation. But
as per patches [1], [2] below, the use of "IS_ERR_OR_NULL()" has been
deprecated.
Hence done this change.

[1] - http://www.mail-archive.com/linux-omap-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg78030.html
[2] - http://comments.gmane.org/gmane.linux.power-management.general/33515

Please let me know your opinion about this change, If not necessary,
will revert back
this change.

Regards,
Manish Badarkhe
