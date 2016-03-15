From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [tegrarcm PATCH V2 1/4] Add support for production devices
 secured with PKC
Date: Tue, 15 Mar 2016 00:51:41 +0000
Message-ID: <f0f79d636da2412f8dad980e4114a4c8@HQMAIL103.nvidia.com>
References: <1457744552-30966-1-git-send-email-jimmzhang@nvidia.com>
 <1457744552-30966-2-git-send-email-jimmzhang@nvidia.com>
 <56E70576.3050000@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56E70576.3050000-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Monday, March 14, 2016 11:40 AM
> To: Jimmy Zhang
> Cc: Allen Martin; Stephen Warren; alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org; linux-
> tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [tegrarcm PATCH V2 1/4] Add support for production devices
> secured with PKC
> 
> On 03/11/2016 06:02 PM, Jimmy Zhang wrote:
> > From: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> >
> > Add the support code needed to sign the RCM messages with RSA-PSS as
> > needed to communicate with secured production devices. This mode is
> > enabled by passing a key via the --pkc command line argument. If such
> > a key is set the RCM messages will be signed with it as well as the
> > bootloader.
> >
> > Signed-off-by: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> > Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >
> > --
> 
> Nit: That needs to be --- not -- for git to recognize it as the end of the commit
> description.
> 
> > Changelog:
> > V3: * Download bl sig only when op_mode is SECURE_PKC
> >      * Generate cmac_hash even when --pkc option is present so that
> >        an unfused board can still run with --pkc option.
> >      * Added Error Check on key length
> 
> Nit: The message subject says "V2".
> 
> In all the patches in this series, please make sure that all the files you edit
> contain an NVIDIA copyright message which references the year 2016. If not,
> please add/update the message.
> 
> > diff --git a/src/rsa-pss.cpp b/src/rsa-pss.cpp
> 
> > +extern "C" int rsa_pss_sign_file(const char *key_file, const char
> *msg_file,
> > +			unsigned char *sig_buf)
> 
> > +		int length = signature.length();
> > +		// error check
> > +		if (length != RCM_RSA_SIG_SIZE)
> > +			throw std::length_error("incorrect rsa key length");
> 
> I think that check is required in rsa_pss_sign() too.

I checked key's modulus length there. Once it passes, key's length should be correct.
