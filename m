From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] regulator: Fix deadlock during regulator registration
Date: Wed, 30 Mar 2016 18:41:03 +0100
Message-ID: <56FC0FAF.3010200@nvidia.com>
References: <1459354153-6352-1-git-send-email-jonathanh@nvidia.com>
 <20160330161831.GE2350@sirena.org.uk> <56FC02CD.60107@nvidia.com>
 <20160330170053.GK2350@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160330170053.GK2350-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 30/03/16 18:00, Mark Brown wrote:
> * PGP Signed by an unknown key
> 
> On Wed, Mar 30, 2016 at 05:46:05PM +0100, Jon Hunter wrote:
> 
> Please fix your mail client to word wrap within paragraphs at something
> substantially less than 80 columns.  Doing this makes your messages much
> easier to read and reply to.
> 
>>> Please don't paste entire backlogs into changelogs, they're *enormous*,
>>> mostly noise and obscure any actual content that's in there through
>>> denial of service.  If they're useful then include edited subsets that
>>> highlight the relevant sections of the backtrace so your changelog is
>>> more legible.
> 
>> Ok, no problem. Are you happy with the patch otherwise? If so, do you
>> want me to resend or do you wish to trim the backlog? I think that
> 
> I haven't reviwed it yet.
> 
>> this part is interesting ...
> 
> I'm really getting nothing at all from this, all it really does is point
> to the call site but that's already much more clearly identified in the
> changelog.  We certainly don't need to know which driver called this.

Ok, fine with me. If you are happy with the actual change, feel free to
remove the backlog or I can re-send if you wish.

Jon
