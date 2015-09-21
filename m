From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [cbootimage PATCH v1 2/8] Add bct_dump support for t210
Date: Mon, 21 Sep 2015 23:27:47 +0000
Message-ID: <6d93651da9bf481088b332a28f056249@HQMAIL103.nvidia.com>
References: <1441228760-26042-1-git-send-email-jimmzhang@nvidia.com>
 <1441228760-26042-3-git-send-email-jimmzhang@nvidia.com>
 <56006319.5030009@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56006319.5030009-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Stephen Warren' <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Monday, September 21, 2015 1:06 PM
> To: Jimmy Zhang
> Cc: Allen Martin; Stephen Warren; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [cbootimage PATCH v1 2/8] Add bct_dump support for t210
> 
> On 09/02/2015 03:19 PM, Jimmy Zhang wrote:
> > Added support to dump additional fields such as rsa pubkey, rsa pss
> > signatures for bct and bootloader.
> 
> > diff --git a/src/bct_dump.c b/src/bct_dump.c
> 
> > @@ -54,11 +57,13 @@ static value_data const values[] = {
> >   	{ token_odm_data,            "OdmData       = ", format_u32_hex8 },
> >   	{ token_secure_jtag_control, "JtagCtrl      = ", format_u32_hex8 },
> >   	{ token_secure_debug_control, "DebugCtrl     = ", format_u32_hex8
> },
> > +	{ token_crypto_hash, 	     "BCT AES Hash  = ", format_hex_16_bytes
> },
> > +	{ token_pub_key_modulus,     "PubKeyModulus = ",
> format_rsa_param },
> > +	{ token_rsa_pss_sig_bct,     "RsaPssSig_Bct = ", format_rsa_param },
> 
> The previous patch didn't have an underscore in the keyword name. We
> should be able to feed the output of bctdump straight back into cbootimage
> without having to manually fix up the syntax.
> 
> That said, I wonder if either (a) shouldn't this data be dumped to a file, since
> cbootimage would read it from a separate file (b) shouldn't cbootimage read
> the data from an inline value not a separate file. The use can always use the C
> pre-processor or similar "code generation"
> techniques to create the file from a template in order to use different keys
> for different devices.
> 

Good inspiration. We don't limit how this tool is being used. I mainly used it for debug purpose.

I will remove the under score as you suggested.
  
> > -	{ token_hash_size,           "# Hash size             = ", format_u32 },
> 
> Is there a reason for removing that? If so, it should be mentioned in the
> patch description.
> 

This piece of code is not needed for dump_bct.  I can add descriptions in commit message. Otherwise, I can revert it.

> > diff --git a/src/t210/nvbctlib_t210.c b/src/t210/nvbctlib_t210.c
> 
> > +	case token_rsa_pss_sig_bl:
> > +		/* ONLY support one bl */
> > +		memcpy(data, &bct_ptr-
> >bootloader[set].signature.rsa_pss_sig,
> > +			sizeof(nvboot_rsa_pss_sig));
> > +		break;
> 
> Same objection about that comment here as in the previous patch.

Explained earlier.

> 
> > @@ -2121,15 +2128,23 @@ t210_bct_get_value(parse_token id, void
> *data,
> > u_int8_t *bct)
> 
> >   	case token_crypto_hash:
> > -		memcpy(data,
> > -		&(bct_ptr->signature.crypto_hash),
> > -		sizeof(nvboot_hash));
> > +		memcpy(data, &(bct_ptr->signature.crypto_hash),
> > +			sizeof(nvboot_hash));
> 
> This feels like an unrelated cleanup patch?
OK. I will revert it.
