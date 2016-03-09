From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [tegrarcm PATCH v1 2/4] Add option --ml_rcm <rcm_ml_blob>
Date: Wed, 9 Mar 2016 01:21:29 +0000
Message-ID: <efa82104830b489a8ebe29238bb48034@HQMAIL103.nvidia.com>
References: <1457135087-967-1-git-send-email-jimmzhang@nvidia.com>
 <1457135087-967-3-git-send-email-jimmzhang@nvidia.com>
 <56DDE16A.8030809@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56DDE16A.8030809-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Monday, March 07, 2016 12:16 PM
> To: Jimmy Zhang
> Cc: Allen Martin; Stephen Warren; alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org; linux-
> tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [tegrarcm PATCH v1 2/4] Add option --ml_rcm <rcm_ml_blob>
> 
> On 03/04/2016 04:44 PM, Jimmy Zhang wrote:
> > This option along with "--pkc <keyfile>" allows user to generate
> > signed query version rcm, miniloader rcm and signed bootloader
> > (flasher). With these signed blob, user will then be able to run
> > tegrarcm on a fused system without keyfile.
> 
> That says "without keyfile", yet ...
> 

Andrew helped me updating commit messages as below:

This option along with "--pkc <keyfile>" allows user to generate
signed query version rcm, miniloader rcm and signed bootloader
 (flasher). With the signed blob, user will then be able to later run
tegrarcm on a fused system without needing the actual keyfile.

> > Command syntax:
> >   $ ./tegrarcm --ml_rcm <ml_rcm_blob> --pkc <keyfile>
> >
> > Example:
> > 1. connect usb cable to recovery mode usb port 2. put target in
> > recovery mode 3. run command as below:
> > $ sudo ./tegrarcm --ml_rcm t124_ml_rcm.bin --pkc rsa_priv.der
> 
> ... in both those examples, the PKC file is provided as an argument.
> That seems inconsistent.
> 
> Oh, having read more of the patch, I see this patch is all about
> *generating* the signed messages, and presumably a later patch is about
> executing them. That's not at all obvious from the patch subject or even
> particularly obvious from the patch descriptions.
> 
> Equally, I see that the parameter to --ml_rcm is the base part of a filename,
> to which various extensions will be concatenated to form various actual
> filenames that are written to. This needs to be more clearly spelled out in the
> commit description. The help text:
> 
> > +	fprintf(stderr, "\t--ml_rcm=ml_rcm_file\n");
> > +	fprintf(stderr, "\t\tSave rcm message prefixed miniloader\n");
> 
> ... is also not at all clear or illuminating.
> 
> I don't see any changes to src/tegrarcm.1 in this series. The man page needs
> to document all the new functionality.
> 

Originally, this option is used to extract and save miniloader rcm to a file. Now, with patch 1/4, the saved rcm contains pkc sig as well.
So, I should probably select a different word for this function. How about "--sign"? 

Then, the option "--signed" in 3/4 becomes too similar. Any suggestion for a better option key word there?

> > diff --git a/src/main.c b/src/main.c
> > +	/* error check */
> > +	if (ml_rcm_file) {
> > +		/* ml_rcm option must also come along with pkc option */
> > +		if (pkc == NULL) {
> > +			fprintf(stderr, "PKC key file must be specified\n");
> 
> I would add "if --ml_rcm is" or "with --mc_rcm" or something like that.
> 
> > -		usage(argv[0]);
> > -		exit(EXIT_FAILURE);
> > +		goto usage_exit;
> 
> That looks like an unrelated change; a cleanup patch.
> 

OK

> > +static int create_name_string(const char *in, char *out, char *ext)
> 
> I would suggest re-ordering the parameters so all input and output pointers
> are next to each-other. The existing order is a bit confusing.
> (i.e. in ext out, or out in ext to be more like str/memcpy).
> 
> > +	sprintf(out, "%s%s\n", in, ext);
> > +	*(out + len + strlen(ext)) = 0x0;
> 
> Doesn't that happen automatically since you're using sprintf() not snprintf()?
> 

OK.

> Why use a temporary variable to store strlen(in) but not another to store
> strlen(ext); they're both used twice.
> 
OK

> > +static int save_to_file(const char *filename, const uint8_t *msg_buff,
> > +			const uint32_t length)
> >   {
> > +	FILE *raw_file;
> 
> f, fp, or file would be more typical variable names; there aren't multiple files
> (e.g. one raw, one not) to differentiate between, so "raw_" doesn't seem
> necessary.
> 
Ok

> > diff --git a/src/rcm.c b/src/rcm.c
> 
> > @@ -202,11 +202,12 @@ static int rcm35_sign_msg(uint8_t *buf)
> >   		return -EMSGSIZE;
> >   	}
> >
> > +	cmac_hash(msg->reserved, crypto_len, msg-
> >object_sig.cmac_hash);
> > +
> >   	if (rcm_keyfile)
> >   		rsa_pss_sign(rcm_keyfile, msg->reserved, crypto_len,
> >   			msg->object_sig.rsa_pss_sig, msg->modulus);
> > -	else
> > -		cmac_hash(msg->reserved, crypto_len, msg-
> >object_sig.cmac_hash);
> > +
> 
> This looks like it should be part of patch 1/4? Same for rcm40_sign_msg()?
OK.
