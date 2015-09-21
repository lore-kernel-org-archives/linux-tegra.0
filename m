From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [cbootimage PATCH v1 1/8] Enable --update | -u option support for
 t210
Date: Mon, 21 Sep 2015 23:07:04 +0000
Message-ID: <70e03bb57bce4022ada751d50a29e301@HQMAIL103.nvidia.com>
References: <1441228760-26042-1-git-send-email-jimmzhang@nvidia.com>
 <1441228760-26042-2-git-send-email-jimmzhang@nvidia.com>
 <5600609F.60002@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5600609F.60002-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Stephen Warren' <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Monday, September 21, 2015 12:55 PM
> To: Jimmy Zhang
> Cc: Allen Martin; Stephen Warren; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [cbootimage PATCH v1 1/8] Enable --update | -u option support
> for t210
> 
> On 09/02/2015 03:19 PM, Jimmy Zhang wrote:
> > Added routines to allow updating pkc pubkey and rsa pss signatures.
> 
> "pkc" and "pss" should be explained.
Do you mean it should be written like Public-Key Cryptography (pkc) and Probabilistic Signature Scheme (pss)?
> 
> > Specifically, added following configuration keywords:
> >
> >     RsaKeyModulus: set pubkey
> >     RsaPssSigBl:   set bootloader rsa pss signature
> >     RsaPssSigBct:  set bct rsa pss signature
> >
> > Sample Configuration file update_bl_sig.cfg
> >     RsaKeyModulus = pubkey.mod;
> >     RsaPssSigBl = bl.sig;
> 
> Oh, RsaKeyModulus is a file not an inline value? Better put "File" or
> "Filename" into the keywords then?

OK. We use filename inside configuration file for bct and boot loader. For example, use keyword "BootLoader"  to specify boot loader:
BootLoader    = u-boot.bin,0x80108000,0x80108000,Complete;

Should the keywords be changed to:

RsaKeyModulusFile = <...>;
RsaPssSigBlFile = <...>;

> 
> How can the user generate the value for RsaPssSigBct if this tool is generating
> the BCT? Why doesn't this tool generate the signatures itself internally?
>
 
This patch is only about option "--update". Signing function is added in patch 6 and 7.

To test out this patch, I used nv internal tool tegrasign to generate signature files.

> > Commandline example:
> >     $ cbootimage -s tegra210 -u update_bl_sig.cfg image.bin
> > image.bin-bl-signed
> 
> This commit appears to be two unrelated changes squashed into one. This
> commit description is entirely unrelated to the commit subject for example.
> 
> > diff --git a/src/cbootimage.c b/src/cbootimage.c
> 
> >   	printf("    -u|--update           Copy input image data and update
> bct\n");
> >   	printf("                          configs into new image file.\n");
> > -	printf("                          This feature is only for tegra114/124.\n");
> > +	printf("                          This feature is only for tegra114/124/210.\n");
> 
> I assume this feature will be enabled by default going forward. I think it'd be
> better to rephrase that as "This feature is not supported on Tegra20/30".
> 
> BTW, is there a particular reason the feature won't work there? If not, can
> we simply enable it for all chips?
> 
> >   		if (context->boot_data_version !=
> BOOTDATA_VERSION_T114 &&
> > -			context->boot_data_version !=
> BOOTDATA_VERSION_T124) {
> > -			printf("Update image feature is only for Tegra114 and
> Tegra124.\n");
> > +			context->boot_data_version !=
> BOOTDATA_VERSION_T124 &&
> > +			context->boot_data_version !=
> BOOTDATA_VERSION_T210) {
> > +			printf("Update image feature is only for Tegra114,
> Tegra124"
> > +				" and Tegra210.\n");
> >   			return -EINVAL;
> 
> To avoid that if expanding forever, can it not check for == T20/30 rather than
> != all other chips?
> 
> 

I can split this patch into two patches.

"--update | -u" option was added since T114. If there is any needs for T20 and T30, it can be added in.

> > diff --git a/src/cbootimage.h b/src/cbootimage.h
> 
> > @@ -105,6 +109,7 @@ typedef struct build_image_context_rec
> >   	u_int32_t mts_attr;
> >
> >   	char *bct_filename;
> > +	char *rsa_filename;
> 
> RSA *what* filename? This patch introduces 3 different RSA-related
> keywords. A more complete variable name would be useful so it's obvious
> which keyword's value is being stored here. Comments would be useful too.
> 

Agree. In fact, it was replaced by pkckey. I forgot to remove it. 

> > diff --git a/src/parse.c b/src/parse.c
> 
> > @@ -116,6 +118,9 @@ static parse_item s_top_level_items[] = {
> >   	{ "ChipUid=",       token_unique_chip_id,	parse_value_chipuid
> },
> >   	{ "JtagCtrl=",	    token_secure_jtag_control,	parse_value_u32 },
> >   	{ "DebugCtrl=",	    token_secure_debug_control,
> 	parse_value_u32 },
> > +	{ "RsaKeyModulus=", token_pub_key_modulus,
> 	parse_rsa_param },
> 
> Why "RsaKey" in the keyword name but "pub_key" in the enumeration?

Agree. It is a bit confusion. I guess I generally followed what have been used in nv internal tool. RsaKeyModulus is value n, ie p*q. pub_key in RSA scheme is a pair value of (n, e).  Since e is a constant 0x10001, RsaKeyModulus is then simply handled as public key.

I will change pub_key_modulus to rsa_key_modulus.

> 
> > diff --git a/src/set.c b/src/set.c
> 
> > +int
> > +set_rsa_param(build_image_context *context, parse_token token,
> > +		const char *filename)
> ...
> > +	if (result || (actual_size != ARSE_RSA_PARAM_MAX_BYTES)) {
> > +		if (result)
> > +			printf("Error reading file %s.\n", filename);
> > +		else
> > +			printf("Error: invalid size, file %s.\n", filename);
> > +		exit(1);
> > +        }
> 
> Since those are two entirely separate error cases, writing two entirely
> separate if conditions would be better:
> 
> if (result) {
>      printf
>      exit
> }
> if (actual_size != ... {
>      printf
>      exit
> }
> 

OK.

> > diff --git a/src/t210/nvbctlib_t210.c b/src/t210/nvbctlib_t210.c
> 
> > @@ -2198,6 +2201,21 @@ t210_bct_set_value(parse_token id, void *data,
> u_int8_t *bct)
> >   		memcpy(&bct_ptr->unique_chip_id, data,
> sizeof(nvboot_ecid));
> >   		break;
> >
> > +	case token_pub_key_modulus:
> > +		memcpy(&bct_ptr->key, data,
> sizeof(nvboot_rsa_key_modulus));
> > +		break;
> > +
> > +	case token_rsa_pss_sig_bl:
> > +		/* ONLY support one bl */
> > +		memcpy(&bct_ptr->bootloader[0].signature.rsa_pss_sig,
> > +			data, sizeof(nvboot_rsa_pss_sig));
> 
> That comment is unfortunate. Can we not make this keyword an array, so
> that this limitation does not exist? If not, won't this require a
> non-backwards-compatible syntax change when we add support for more
> than
> one bootloader (which incidentally is a feature I expect will be
> implemented not too far down the road...)

Since day one, cbootimage can only support one boot loader. Ie, form a bootable image that contains only one copy of bootloader. This is determined by configuration file key word "BootLoader".  I guess adding multi copies bootloader support propably belongs to another series of patches.
