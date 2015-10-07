From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [tegrarcm PATCH v2 2/4] Add support for update pubkey and rsa-pss
 signatures
Date: Wed, 7 Oct 2015 19:00:24 +0000
Message-ID: <040281d81f664bd99ad3012229151d69@HQMAIL103.nvidia.com>
References: <1443819420-26562-1-git-send-email-jimmzhang@nvidia.com>
 <1443819420-26562-3-git-send-email-jimmzhang@nvidia.com>
 <56154FC5.2000305@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56154FC5.2000305-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Stephen Warren' <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Wednesday, October 07, 2015 10:01 AM
> To: Jimmy Zhang
> Cc: Allen Martin; Stephen Warren; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [tegrarcm PATCH v2 2/4] Add support for update pubkey and
> rsa-pss signatures
> 
> On 10/02/2015 02:56 PM, Jimmy Zhang wrote:
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
> > Above three new keywords added in this CL are only implemented support
> > for T210.
> 
> > diff --git a/src/set.c b/src/set.c
> 
> > +set_rsa_param(build_image_context *context, parse_token token,
> > +		char *filename)
> 
> > +	file_type rsa_filetype = file_type_bin;
> > +
> > +        /* Read the image into memory. */
> > +	result = read_from_image(filename,
> > +				0,
> > +				ARSE_RSA_PARAM_MAX_BYTES,
> > +				&rsa_storage,
> > +				&actual_size,
> > +				rsa_filetype);
> 
> Why do we need a variable "ras_filetype"? Why not just pass file_type_bin
> directly as the function parameter?

Agree. Will clean it up.
