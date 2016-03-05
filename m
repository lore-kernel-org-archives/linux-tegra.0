From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [tegrarcm PATCH v1 2/4] Add option --ml_rcm <rcm_ml_blob>
Date: Sat, 5 Mar 2016 02:35:51 +0000
Message-ID: <b47263cc6b5a412bbbb9cd4a17d223cf@HQMAIL103.nvidia.com>
References: <1457135087-967-1-git-send-email-jimmzhang@nvidia.com>
 <1457135087-967-3-git-send-email-jimmzhang@nvidia.com>
 <20160305012506.GA19189@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160305012506.GA19189-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



> -----Original Message-----
> From: Allen Martin
> Sent: Friday, March 04, 2016 5:25 PM
> To: Jimmy Zhang
> Cc: Stephen Warren; alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org; linux-
> tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [tegrarcm PATCH v1 2/4] Add option --ml_rcm <rcm_ml_blob>
> 
> On Fri, Mar 04, 2016 at 03:44:45PM -0800, Jimmy Zhang wrote:
> > This option along with "--pkc <keyfile>" allows user to generate
> > signed query version rcm, miniloader rcm and signed bootloader
> > (flasher). With these signed blob, user will then be able to run
> > tegrarcm on a fused system without keyfile.
> >
> > Command syntax:
> >  $ ./tegrarcm --ml_rcm <ml_rcm_blob> --pkc <keyfile>
> >
> > Example:
> > 1. connect usb cable to recovery mode usb port 2. put target in
> > recovery mode 3. run command as below:
> > $ sudo ./tegrarcm --ml_rcm t124_ml_rcm.bin --pkc rsa_priv.der
> >
> 
> Why this extra step to write the signed miniloader to a separate file?
> Why not just sign the miniloader in memory when using the --signed
> option?  It looks like this is also generating a file for the signed
> RCM messages, which should just be done in memory as well like we do
> when using CMAC signing.
> 
This is for production purpose for fused board. User can run this step to generate all signed blobs
from a secured server. On production server, assuming non secured, user uses previous signed
blobs to download flasher on fused board. By doing so, we can avoid to send rsa keyfile to
production server.

> 
> > +static int initialize_rcm(uint16_t devid, usb_device_t *usb,
> > +			const char *keyfile, const char *ml_rcm_file)
> > +{
> > +	int ret = 0;
> >  	uint8_t *msg_buff;
> >  	int msg_len;
> >  	uint32_t status;
> >  	int actual_len;
> > +	#define query_rcm_ext	".qry"
> 
> Don't need this #define, just use ".qry" directly below
>
OK. Will fix it.
> 
> > +static int sign_blob(const char *blob_filename, const char *keyfile)
> > +{
> > +	int ret;
> > +	uint8_t rsa_pss_sig[2048 / 8];
> > +
> > +	#define sign_ext	".sig"
> 
> Here too
> 
> 
> > diff --git a/src/rcm.c b/src/rcm.c
> > index c7f0f8dddecc..cdf81309ae96 100644
> > --- a/src/rcm.c
> > +++ b/src/rcm.c
> > @@ -202,11 +202,12 @@ static int rcm35_sign_msg(uint8_t *buf)
> >  		return -EMSGSIZE;
> >  	}
> >
> > +	cmac_hash(msg->reserved, crypto_len, msg-
> >object_sig.cmac_hash);
> > +
> >  	if (rcm_keyfile)
> >  		rsa_pss_sign(rcm_keyfile, msg->reserved, crypto_len,
> >  			msg->object_sig.rsa_pss_sig, msg->modulus);
> > -	else
> > -		cmac_hash(msg->reserved, crypto_len, msg-
> >object_sig.cmac_hash);
> 
> I don't understand this part, this looks like it undoes what you put
> in the previous patch.
> 
User may run this process on unfuse board. In that case, BR still verifies  cmac_hash.
cmac_hash and rsa_pss_sig are in different fields and can coexist.
 
> 
> > @@ -226,11 +227,10 @@ static int rcm40_sign_msg(uint8_t *buf)
> >  		return -EMSGSIZE;
> >  	}
> >
> > +	cmac_hash(msg->reserved, crypto_len, msg-
> >object_sig.cmac_hash);
> >  	if (rcm_keyfile)
> >  		rsa_pss_sign(rcm_keyfile, msg->reserved, crypto_len,
> >  			msg->object_sig.rsa_pss_sig, msg->modulus);
> > -	else
> > -		cmac_hash(msg->reserved, crypto_len, msg-
> >object_sig.cmac_hash);
> 
> Same here
