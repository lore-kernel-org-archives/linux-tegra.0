From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [cbootimage PATCH v6 1/5] Add support for update pubkey and
 rsa-pss signatures
Date: Mon, 19 Oct 2015 22:50:12 +0000
Message-ID: <bd6d53c85e874253ab9d074c4e55e9ee@HQMAIL103.nvidia.com>
References: <1445281385-28020-1-git-send-email-jimmzhang@nvidia.com>
 <1445281385-28020-2-git-send-email-jimmzhang@nvidia.com>
 <562554C5.1010504@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <562554C5.1010504-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Stephen Warren' <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Monday, October 19, 2015 1:38 PM
> To: Jimmy Zhang
> Cc: Allen Martin; Stephen Warren; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [cbootimage PATCH v6 1/5] Add support for update pubkey and
> rsa-pss signatures
> 
> On 10/19/2015 01:03 PM, Jimmy Zhang wrote:
> > Create new configuration keywords:
> >     RsaKeyModulusFile: pubkey modulus
> >     RsaPssSigBlFile:   bootloader rsa pss signature
> >     RsaPssSigBctFile:  bct rsa pss signature
> >
> > Sample Configuration file update_bl_sig.cfg
> >     RsaKeyModulusFile = pubkey.mod;
> >     RsaPssSigBlFile = bl.sig;
> >
> > where pubkey.mod and bl.sig are files that contain the public key
> > modulus and bootloader's rsa-pss signature respectively.
> >
> > public key modulus and signature are created through utilities outside
> > cbootimage.
> >
> > Command line example:
> >   $ cbootimage -s tegra210 -u update_bl_sig.cfg image.bin
> > image.bin-bl-signed
> >
> > Above three new keywords added in this CL are only implemented to
> > support for T210.
> >
> > Changes in V6:
> > 1) Rename function swap_endianness() to reverse_byte_order()
> > 2) Put "size - 1 - i" to a variable to avoid double calculation
> > 3) Remove checking NULL pointer of get_value_size() in function
> > set_rsa_param()
> > 4) Change function prototype for get_value_size()
> 
> The changelog should be below the --- line since it's not typically checked in.
> 
> >   src/t114/nvbctlib_t114.c |  1 +
> >   src/t124/nvbctlib_t124.c |  1 +
> >   src/t210/nvbctlib_t210.c | 46
> > +++++++++++++++++++++++++++++++++++++++++++++-
> 
> t20, t30, t132 files should be updated to add an implementation of struct
> cbootimage_soc_config .get_value_size too.
> 
> I was going to apply these patches and then send a patch to fix that up, but I
> noticed that this series introduces a bunch of warnings. Can you submit v7
> that builds cleanly, has that fixed, and:
> 
> > diff --git a/src/crypto.c b/src/crypto.c
> 
> > +void
> > +reverse_byte_order(
> > +	u_int8_t *out,
> > +	u_int8_t *in,
> 
> "in" should be const.

OK. Will submit V7 shortly.
