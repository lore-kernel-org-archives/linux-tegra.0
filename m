From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [tegrarcm PATCH V2 3/4] Add option --download-signed-msgs to
 download signed blobs
Date: Mon, 14 Mar 2016 20:01:28 +0000
Message-ID: <41214cca62234ce1b7f238fa8fcb71aa@HQMAIL103.nvidia.com>
References: <1457744552-30966-1-git-send-email-jimmzhang@nvidia.com>
 <1457744552-30966-4-git-send-email-jimmzhang@nvidia.com>
 <56E70E4F.80307@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56E70E4F.80307-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Monday, March 14, 2016 12:18 PM
> To: Jimmy Zhang
> Cc: Allen Martin; Stephen Warren; alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org; linux-
> tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [tegrarcm PATCH V2 3/4] Add option --download-signed-msgs to
> download signed blobs
> 
> On 03/11/2016 06:02 PM, Jimmy Zhang wrote:
> > This feature allows user to download signed messages to devices
> > secured with PKC.
> >
> > Example:
> > tegrarcm --download-signed-msgs --signed-msgs-file rel_1001.bin \
> >     --bct=jetson-tk1-bct.bct --bootloader=u-boot.bin
> > --loadaddr=0x83d88000
> >
> > Where the following blob files are downloaded to device sequentially:
> >
> > a) rel_1001.bin.qry
> > b) rel_1001.bin.ml
> > c) rel_1001.bin.bl
> 
> > @@ -1083,14 +1198,24 @@ static int download_bootloader(nv3p_handle_t
> h3p, char *filename,
> >   			}
> >
> >   			ret = nv3p_data_send(h3p, rsa_pss_sig,
> sizeof(rsa_pss_sig));
> > -			if (ret) {
> > -				dprintf("error sending bootloader
> signature\n");
> > +		}
> 
> Doesn't this change (moving that error dprintf later) mean that any error
> there potentially won't be reported, since the code below can overwrite
> "ret" before the moved copy of that check? I'm not convinced the code
> should be moved.
> 

No. This is because only one can be true between pkc_keyfile and signed_msgs_file. Ie, either when signing on fly or signed without keyfile option. This logic is ensured in main when checking command line options.
  
> > +		/* download bl's rsa_pss_sig */
> > +		if (signed_msgs_file) {
> > +			char signature_filename[FILENAME_MAX_SIZE];
> > +
> > +			ret = create_name_string(signature_filename,
> > +						signed_msgs_file, ".bl");
> > +			if (ret)
> >   				return ret;
> > +
> > +			// send the bootloader file

The comment will be changed to "send the bootloader's signature file"
 
> > +			ret = send_file(h3p, signature_filename);
> > +		}
> > +
> > +		if (ret) {
> > +			dprintf("error sending bootloader signature\n");
> > +			return ret;
> >   		}
> >   	}
> 
> The resultant logic here seems to do the following for chips in SECURE_PKC
> mode:
> 
> a) Always calculate and send the PKC.
> b) if (signed_msgs_file), send the content of that file
> c) continue to send the bootloader
> 
> I would have expected either (a) or (b) to happen, but never both.

It is true. The answer is the same as above. Only one can be true between pkc_keyfile and signed_msgs_file.
