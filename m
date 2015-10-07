From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [tegrarcm PATCH v2 3/4] Add support to dump rsa related fields
 for t210
Date: Wed, 7 Oct 2015 22:10:17 +0000
Message-ID: <522c5bd69a114b23aa468d4cdc1dce76@HQMAIL103.nvidia.com>
References: <1443819420-26562-1-git-send-email-jimmzhang@nvidia.com>
 <1443819420-26562-4-git-send-email-jimmzhang@nvidia.com>
 <56154C29.90708@wwwdotorg.org>
 <8ad0a6e53ee44852a89c71989b584e1e@HQMAIL103.nvidia.com>
 <56157261.9030000@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56157261.9030000-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Stephen Warren' <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Wednesday, October 07, 2015 12:29 PM
> To: Jimmy Zhang
> Cc: Allen Martin; Stephen Warren; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [tegrarcm PATCH v2 3/4] Add support to dump rsa related fields
> for t210
> 
> On 10/07/2015 12:57 PM, Jimmy Zhang wrote:
> >
> >
> >> -----Original Message-----
> >> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> >> Sent: Wednesday, October 07, 2015 9:45 AM
> >> To: Jimmy Zhang
> >> Cc: Allen Martin; Stephen Warren; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> >> Subject: Re: [tegrarcm PATCH v2 3/4] Add support to dump rsa related
> >> fields for t210
> >>
> >> On 10/02/2015 02:56 PM, Jimmy Zhang wrote:
> >>> Add support to dump rsa pubkey, bct's rsa-pss signature and
> >>> bootloader's rsa-pss signature.
> >>
> >> It also seems to dump some AES hashes too.
> >>
> >>> diff --git a/src/bct_dump.c b/src/bct_dump.c
> >>
> >>> +static void format_rsa_param(char const * message, void * data) {
> >>> +	u_int8_t *rsa = (u_int8_t *)data;
> >>> +	int byte_index;
> >>> +
> >>> +	printf("%s", message);
> >>> +	for (byte_index = 0; byte_index < ARSE_RSA_PARAM_MAX_BYTES;
> >>> +					++byte_index) {
> >>> +		printf("%02x", *rsa++);
> >>> +
> >>> +		if (byte_index && ((byte_index + 1) % 64 == 0))
> >>> +			printf(";\n");
> >>> +	}
> >>> +
> >>> +	if (byte_index && (byte_index % 64 != 0))
> >>> +			printf(";\n");
> >>> +}
> >>
> >> The same comment about hard-coding ARSE_RSA_PARAM_MAX_BYTES
> applies
> >> here as in the previous commit.
> >>
> >> It would be nice if this function wrote the values to a file. That
> >> way, the output of bct_dump would be something you could feed into
> >> cbootimage directly. With this patch, the user has to manually
> >> convert the inline hex data into a binary file before the output is useful.
> >>
> >> Still, solving that might be challenging. If bct_dump wrote to a
> >> user-supplied filename, the files could simply be named
> "${filename}.RsaKeyModulus" etc.
> >> However, since bct_dump prints to stdout, that's not possible.
> >> Perhaps since bct_dump is mostly a debug aid, we can live with this issue
> for now.
> >
> > Maybe we should add a command line option to save RsaKey modulus to a
> given file.  I can come up another patch after this series is merged.
> 
> That would work. The issue is there are 3 tokens which implies 3 command-
> line options (and may be more tokens if we extend cbootimage to support N
> BCT copies, N bootloaders, etc.).
> 
> Perhaps best would be:
> 
> bct_dump foo.bin
> -> Prints results to stdout, with inline dumps of the RSA fields
> 
> bct_dump -o foo.cfg foo.bin
> -> "Prints" results to foo.cfg, and puts all the RSA fields (as binary)
> into foo.cfg.RsaKeyModulus (and a variety of other auto-named files)?

OK. Will do.
