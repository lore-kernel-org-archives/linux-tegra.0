From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [tegrarcm PATCH v2 2/4] Add support for update pubkey and rsa-pss
 signatures
Date: Wed, 7 Oct 2015 18:17:20 +0000
Message-ID: <226c0277e93a4a3484f55307ac7e8b2a@HQMAIL103.nvidia.com>
References: <1443819420-26562-1-git-send-email-jimmzhang@nvidia.com>
 <1443819420-26562-3-git-send-email-jimmzhang@nvidia.com>
 <20151007170821.GA29271@nvidia.com> <561552E5.9040402@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <561552E5.9040402-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Stephen Warren' <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Wednesday, October 07, 2015 10:14 AM
> To: Allen Martin; Jimmy Zhang
> Cc: Stephen Warren; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [tegrarcm PATCH v2 2/4] Add support for update pubkey and
> rsa-pss signatures
> 
> On 10/07/2015 11:08 AM, Allen Martin wrote:
> > On Fri, Oct 02, 2015 at 01:56:58PM -0700, Jimmy Zhang wrote:
> >>
> >> Sample Configuration file update_bl_sig.cfg
> >>     RsaKeyModulusFile = pubkey.mod;
> >>     RsaPssSigBlFile = bl.sig;
> >>
> >> where pubkey.mod and bl.sig are files that contain the public key
> >> modulus and bootloader's rsa-pss signature respectively.
> >
> > I think this needs some documentation to show the whole flow of how
> > it's expected to be used in conjunction with openssl.  We don't have a
> > man page for cbootimage now, but if I create a patch to add one can
> > you add some instructions there about the whole flow?
> 
> A README.txt would simplify the process of reading the documentation (i.e.
> plain text rather than man page) or building the SW. At least for people
> reading the docs in the source tree. I suppose if someone actually installs the
> SW rather than simply building it in place, then a man page is more
> convenient:-)

That will be great.  I thought about where I should submit the sample script that I have tested. I will add it to README.txt and the man page after you create it.
