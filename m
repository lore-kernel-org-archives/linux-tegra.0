From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [tegrarcm PATCH v2] Add support for production devices secured
 with PKC
Date: Mon, 29 Feb 2016 23:03:01 +0000
Message-ID: <fbd256251e014b23a189337a7d251da0@HQMAIL103.nvidia.com>
References: <1456768181-12983-1-git-send-email-alban.bedel@avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="_002_fbd256251e014b23a189337a7d251da0HQMAIL103nvidiacom_"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1456768181-12983-1-git-send-email-alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

--_002_fbd256251e014b23a189337a7d251da0HQMAIL103nvidiacom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Alban,

First of all, I believe the code your added here should and will work. Howe=
ver, it is probably purely coincident that I was adding similar functions a=
s requested by Avionic Design (AD) in the last a few weeks. I think we coul=
d merge both approaches and result in one best solution.=20

The main differences between your and mine are:
1. When to sign.
    My solution is to separate signing and flashing. Ie, signing can be don=
e at a secure server and flashing at non-secure factory. During flashing, o=
nly signed RCM messages and bootloader are needed. No pkc private key file =
is required to be present at factory. This private key management feature i=
s also requested by AD. Your solution requires the rsa key file being prese=
nt when downloading flasher.

    I will send you my complete solution in another email thread. =20

2. How to sign
    When I was adding rsa signing supporting functions into cbootimage for =
t210, the consensus is not adding rsa signing code into cbootimage. Instead=
, we should utilize openssl.  So, we ended up a shell script that calls ope=
nssl, cbootimage and other utilities to sign a given bootimage. What was ad=
ded into cbootimage are some new configuration options that take rsa key's =
modulus and signatures as file and embed them into bootimage. I saw you hav=
e expanded rsa supporting to T124. With TOT cbootimage, I can run the attac=
hed script to sign T124 bootimage.

    So, the solution I provided has no any rsa signing functions added into=
 tegrarcm. Instead, use shell script to call openssl and modified tegrarcm =
to support for rsa signing.

     If my understanding is correct, the rsa signing functions you added he=
re are only APIs. The actually signing are actually done by cryptlib. So, i=
t is kind of in the middle. If everyone agrees, I am fine with it.


> -----Original Message-----
> From: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org [mailto:linux-tegra-
> owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org] On Behalf Of Alban Bedel
> Sent: Monday, February 29, 2016 9:50 AM
> To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: Alban Bedel
> Subject: [tegrarcm PATCH v2] Add support for production devices secured
> with PKC
>=20
> Add the support code needed to sign the RCM messages with RSA-PSS as
> needed to communicate with secured production devices. This mode is
> enabled by passing a key via the --pkc command line argument. If such a k=
ey
> is set the RCM messages will be signed with it as well as the bootloader.
>=20
> Signed-off-by: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> --
> Changelog:
> v2: * Added the missing bootloader signature
>     * Added the ODM secure PKC mode to the supported operating modes
>     * Renamed the --key option to --pkc to avoid potential ambiguities
>       if SKB mode is ever supported.
>     * Added a copyright header to the new files
> ---
>  src/Makefile.am |   2 +
>  src/main.c      |  51 ++++++++++++++++----
>  src/rcm.c       |  20 ++++++--
>  src/rcm.h       |   3 +-
>  src/rsa-pss.cpp | 147
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  src/rsa-pss.h   |  46 ++++++++++++++++++
>  6 files changed, 256 insertions(+), 13 deletions(-)  create mode 100644
> src/rsa-pss.cpp  create mode 100644 src/rsa-pss.h
>=20
> diff --git a/src/Makefile.am b/src/Makefile.am index 4b54885..3dad0e6
> 100644
> --- a/src/Makefile.am
> +++ b/src/Makefile.am
> @@ -8,6 +8,8 @@ tegrarcm_SOURCES =3D \
>  	nv3p.c \
>  	debug.c \
>  	rcm.c \
> +	rsa-pss.cpp \
> +	rsa-pss.h \
>  	aes-cmac.cpp \
>  	aes-cmac.h \
>  	debug.h \
> diff --git a/src/main.c b/src/main.c
> index 3db0ed8..fedeab2 100644
> --- a/src/main.c
> +++ b/src/main.c
> @@ -44,6 +44,7 @@
>  #include "nv3p.h"
>  #include "nv3p_status.h"
>  #include "aes-cmac.h"
> +#include "rsa-pss.h"
>  #include "rcm.h"
>  #include "debug.h"
>  #include "config.h"
> @@ -60,7 +61,7 @@
>  // tegra124 miniloader
>  #include "miniloader/tegra124-miniloader.h"
>=20
> -static int initialize_rcm(uint16_t devid, usb_device_t *usb);
> +static int initialize_rcm(uint16_t devid, usb_device_t *usb, const char
> +*keyfile);
>  static int initialize_miniloader(uint16_t devid, usb_device_t *usb, char
> *mlfile, uint32_t mlentry);  static int wait_status(nv3p_handle_t h3p);  =
static
> int send_file(nv3p_handle_t h3p, const char *filename); @@ -69,7 +70,8 @@
> static int download_miniloader(usb_device_t *usb, uint8_t *miniloader,
> static void dump_platform_info(nv3p_platform_info_t *info);  static int
> download_bct(nv3p_handle_t h3p, char *filename);  static int
> download_bootloader(nv3p_handle_t h3p, char *filename,
> -			       uint32_t entry, uint32_t loadaddr);
> +			       uint32_t entry, uint32_t loadaddr,
> +			       const char *pkc_keyfile);
>  static int read_bct(nv3p_handle_t h3p, char *filename);
>=20
>  enum cmdline_opts {
> @@ -81,6 +83,7 @@ enum cmdline_opts {
>  	OPT_VERSION,
>  	OPT_MINILOADER,
>  	OPT_MINIENTRY,
> +	OPT_PKC,
>  #ifdef HAVE_USB_PORT_MATCH
>  	OPT_USBPORTPATH,
>  #endif
> @@ -123,6 +126,10 @@ static void usage(char *progname)
>  	fprintf(stderr, "\t\tminiloader\n");
>  	fprintf(stderr, "\t--miniloader_entry=3D<mlentry>\n");
>  	fprintf(stderr, "\t\tSpecify the entry point for the miniloader\n");
> +	fprintf(stderr, "\t--pkc=3D<key.ber>\n");
> +	fprintf(stderr, "\t\tSpecify the key file for secured devices. The key
> should be\n");
> +	fprintf(stderr, "\t\tin DER format\n");
> +
>  	fprintf(stderr, "\n");
>  }
>=20
> @@ -175,6 +182,7 @@ int main(int argc, char **argv)
>  	int do_read =3D 0;
>  	char *mlfile =3D NULL;
>  	uint32_t mlentry =3D 0;
> +	char *pkc =3D NULL;
>  #ifdef HAVE_USB_PORT_MATCH
>  	bool match_port =3D false;
>  	uint8_t match_bus;
> @@ -191,6 +199,7 @@ int main(int argc, char **argv)
>  		[OPT_VERSION]    =3D {"version", 0, 0, 0},
>  		[OPT_MINILOADER] =3D {"miniloader", 1, 0, 0},
>  		[OPT_MINIENTRY]  =3D {"miniloader_entry", 1, 0, 0},
> +		[OPT_PKC]        =3D {"pkc", 1, 0, 0},
>  #ifdef HAVE_USB_PORT_MATCH
>  		[OPT_USBPORTPATH]  =3D {"usb-port-path", 1, 0, 0},  #endif
> @@ -229,6 +238,9 @@ int main(int argc, char **argv)
>  			case OPT_MINIENTRY:
>  				mlentry =3D strtoul(optarg, NULL, 0);
>  				break;
> +			case OPT_PKC:
> +				pkc =3D optarg;
> +				break;
>  #ifdef HAVE_USB_PORT_MATCH
>  			case OPT_USBPORTPATH:
>  				parse_usb_port_path(argv[0], optarg, @@ -
> 308,7 +320,7 @@ int main(int argc, char **argv)
>  			error(1, errno, "USB read truncated");
>=20
>  		// initialize rcm
> -		ret2 =3D initialize_rcm(devid, usb);
> +		ret2 =3D initialize_rcm(devid, usb, pkc);
>  		if (ret2)
>  			error(1, errno, "error initializing RCM protocol");
>=20
> @@ -355,6 +367,7 @@ int main(int argc, char **argv)
>  	if (info.op_mode !=3D RCM_OP_MODE_DEVEL &&
>  	    info.op_mode !=3D RCM_OP_MODE_ODM_OPEN &&
>  	    info.op_mode !=3D RCM_OP_MODE_ODM_SECURE &&
> +	    info.op_mode !=3D RCM_OP_MODE_ODM_SECURE_PKC &&
>  	    info.op_mode !=3D RCM_OP_MODE_PRE_PRODUCTION)
>  		error(1, ENODEV, "device is not in developer, open, secure, "
>  		      "or pre-production mode, cannot flash"); @@ -366,7
> +379,7 @@ int main(int argc, char **argv)
>  	}
>=20
>  	// download the bootloader
> -	ret =3D download_bootloader(h3p, blfile, entryaddr, loadaddr);
> +	ret =3D download_bootloader(h3p, blfile, entryaddr, loadaddr, pkc);
>  	if (ret)
>  		error(1, ret, "error downloading bootloader: %s", blfile);
>=20
> @@ -376,7 +389,7 @@ int main(int argc, char **argv)
>  	return 0;
>  }
>=20
> -static int initialize_rcm(uint16_t devid, usb_device_t *usb)
> +static int initialize_rcm(uint16_t devid, usb_device_t *usb, const char
> +*keyfile)
>  {
>  	int ret;
>  	uint8_t *msg_buff;
> @@ -388,13 +401,13 @@ static int initialize_rcm(uint16_t devid,
> usb_device_t *usb)
>  	if ((devid & 0xff) =3D=3D USB_DEVID_NVIDIA_TEGRA20 ||
>  	    (devid & 0xff) =3D=3D USB_DEVID_NVIDIA_TEGRA30) {
>  		dprintf("initializing RCM version 1\n");
> -		ret =3D rcm_init(RCM_VERSION_1);
> +		ret =3D rcm_init(RCM_VERSION_1, keyfile);
>  	} else if ((devid & 0xff) =3D=3D USB_DEVID_NVIDIA_TEGRA114) {
>  		dprintf("initializing RCM version 35\n");
> -		ret =3D rcm_init(RCM_VERSION_35);
> +		ret =3D rcm_init(RCM_VERSION_35, keyfile);
>  	} else if ((devid & 0xff) =3D=3D USB_DEVID_NVIDIA_TEGRA124) {
>  		dprintf("initializing RCM version 40\n");
> -		ret =3D rcm_init(RCM_VERSION_40);
> +		ret =3D rcm_init(RCM_VERSION_40, keyfile);
>  	} else {
>  		fprintf(stderr, "unknown tegra device: 0x%x\n", devid);
>  		return errno;
> @@ -720,6 +733,7 @@ static void
> dump_platform_info(nv3p_platform_info_t *info)
>  	case RCM_OP_MODE_DEVEL:             op_mode =3D "developer mode";
> break;
>  	case RCM_OP_MODE_ODM_OPEN:          op_mode =3D "odm open
> mode"; break;
>  	case RCM_OP_MODE_ODM_SECURE:        op_mode =3D "odm secure
> mode"; break;
> +	case RCM_OP_MODE_ODM_SECURE_PKC:    op_mode =3D "odm
> secure mode with PKC"; break;
>  	default:                            op_mode =3D "unknown"; break;
>  	}
>  	printf(" (%s)\n", op_mode);
> @@ -813,7 +827,8 @@ out:
>  }
>=20
>  static int download_bootloader(nv3p_handle_t h3p, char *filename,
> -			       uint32_t entry, uint32_t loadaddr)
> +			       uint32_t entry, uint32_t loadaddr,
> +			       const char *pkc_keyfile)
>  {
>  	int ret;
>  	nv3p_cmd_dl_bl_t arg;
> @@ -849,6 +864,24 @@ static int download_bootloader(nv3p_handle_t h3p,
> char *filename,
>  		return ret;
>  	}
>=20
> +	// When using PKC the bootloader hash must be sent first
> +	if (pkc_keyfile) {
> +		uint8_t rsa_pss_sig[2048 / 8];
> +
> +		ret =3D rsa_pss_sign_file(pkc_keyfile, filename, rsa_pss_sig);
> +		if (ret) {
> +			dprintf("error signing %s with %s\n",
> +				filename, pkc_keyfile);
> +			return ret;
> +		}
> +
> +		ret =3D nv3p_data_send(h3p, rsa_pss_sig, sizeof(rsa_pss_sig));
> +		if (ret) {
> +			dprintf("error sending bootloader signature\n");
> +			return ret;
> +		}
> +	}
> +
>  	// send the bootloader file
>  	ret =3D send_file(h3p, filename);
>  	if (ret) {
> diff --git a/src/rcm.c b/src/rcm.c
> index cb53d8f..c7f0f8d 100644
> --- a/src/rcm.c
> +++ b/src/rcm.c
> @@ -32,6 +32,7 @@
>  #include <errno.h>
>  #include "rcm.h"
>  #include "aes-cmac.h"
> +#include "rsa-pss.h"
>=20
>  static int rcm_sign_msg(uint8_t *buf);
>  static int rcm1_sign_msg(uint8_t *buf); @@ -72,8 +73,9 @@ static uint32_=
t
> rcm_get_msg_buf_len(uint32_t payload_len);
>=20
>  static uint32_t rcm_version =3D 0;
>  static uint32_t message_size =3D 0;
> +static const char *rcm_keyfile =3D NULL;
>=20
> -int rcm_init(uint32_t version)
> +int rcm_init(uint32_t version, const char *keyfile)
>  {
>  	int ret =3D -EINVAL;
>=20
> @@ -92,6 +94,9 @@ int rcm_init(uint32_t version)
>  		message_size =3D sizeof(rcm40_msg_t);
>  		ret =3D 0;
>  	}
> +
> +	rcm_keyfile =3D keyfile;
> +
>  	return ret;
>  }
>=20
> @@ -197,7 +202,11 @@ static int rcm35_sign_msg(uint8_t *buf)
>  		return -EMSGSIZE;
>  	}
>=20
> -	cmac_hash(msg->reserved, crypto_len, msg-
> >object_sig.cmac_hash);
> +	if (rcm_keyfile)
> +		rsa_pss_sign(rcm_keyfile, msg->reserved, crypto_len,
> +			msg->object_sig.rsa_pss_sig, msg->modulus);
> +	else
> +		cmac_hash(msg->reserved, crypto_len, msg-
> >object_sig.cmac_hash);
>  	return 0;
>  }
>=20
> @@ -217,7 +226,12 @@ static int rcm40_sign_msg(uint8_t *buf)
>  		return -EMSGSIZE;
>  	}
>=20
> -	cmac_hash(msg->reserved, crypto_len, msg-
> >object_sig.cmac_hash);
> +	if (rcm_keyfile)
> +		rsa_pss_sign(rcm_keyfile, msg->reserved, crypto_len,
> +			msg->object_sig.rsa_pss_sig, msg->modulus);
> +	else
> +		cmac_hash(msg->reserved, crypto_len, msg-
> >object_sig.cmac_hash);
> +
>  	return 0;
>  }
>=20
> diff --git a/src/rcm.h b/src/rcm.h
> index ab4bea2..fb371b3 100644
> --- a/src/rcm.h
> +++ b/src/rcm.h
> @@ -109,8 +109,9 @@ typedef struct {
>  #define RCM_OP_MODE_DEVEL           0x3
>  #define RCM_OP_MODE_ODM_SECURE      0x4
>  #define RCM_OP_MODE_ODM_OPEN        0x5
> +#define RCM_OP_MODE_ODM_SECURE_PKC  0x6
>=20
> -int rcm_init(uint32_t version);
> +int rcm_init(uint32_t version, const char *keyfile);
>  uint32_t rcm_get_msg_len(uint8_t *msg);  int rcm_create_msg(
>  	uint32_t opcode,
> diff --git a/src/rsa-pss.cpp b/src/rsa-pss.cpp new file mode 100644 index
> 0000000..d9aa8c6
> --- /dev/null
> +++ b/src/rsa-pss.cpp
> @@ -0,0 +1,147 @@
> +/*
> + * Copyright (c) 2015-1016, Avionic Design GmbH
> + * All rights reserved.
> + *
> + * Redistribution and use in source and binary forms, with or without
> + * modification, are permitted provided that the following conditions
> + * are met:
> + *  * Redistributions of source code must retain the above copyright
> + *    notice, this list of conditions and the following disclaimer.
> + *  * Redistributions in binary form must reproduce the above copyright
> + *    notice, this list of conditions and the following disclaimer in th=
e
> + *    documentation and/or other materials provided with the distributio=
n.
> + *  * Neither the name of Avionic Design GmbH nor the names of its
> + *    contributors may be used to endorse or promote products derived
> + *    from this software without specific prior written permission.
> + *
> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS'' AND
> ANY
> + * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
> THE
> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
> PARTICULAR
> + * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER
> OR
> + * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> +SPECIAL,
> + * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> LIMITED TO,
> + * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
> DATA, OR
> + * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
> THEORY
> + * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> + * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
> THE
> +USE
> + * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
> DAMAGE.
> + */
> +#include <iostream>
> +using std::cout;
> +using std::cerr;
> +using std::endl;
> +
> +#include <iomanip>
> +using std::hex;
> +
> +#include <string>
> +using std::string;
> +
> +#include <cstdlib>
> +using std::exit;
> +
> +#include "cryptlib.h"
> +using CryptoPP::Exception;
> +
> +#include "integer.h"
> +using CryptoPP::Integer;
> +
> +#include "files.h"
> +using CryptoPP::FileSource;
> +
> +#include "filters.h"
> +using CryptoPP::StringSink;
> +using CryptoPP::SignerFilter;
> +
> +#include "queue.h"
> +using CryptoPP::ByteQueue;
> +
> +#include "rsa.h"
> +using CryptoPP::RSA;
> +using CryptoPP::RSASS;
> +
> +#include "pssr.h"
> +using CryptoPP::PSS;
> +
> +#include "sha.h"
> +using CryptoPP::SHA256;
> +
> +#include "secblock.h"
> +using CryptoPP::SecByteBlock;
> +
> +#include "osrng.h"
> +using CryptoPP::AutoSeededRandomPool;
> +
> +#include "rsa-pss.h"
> +
> +extern "C" int rsa_pss_sign(const char *key_file, const unsigned char *m=
sg,
> +			int len, unsigned char *sig_buf, unsigned char
> *modulus_buf) {
> +	try {
> +		AutoSeededRandomPool rng;
> +		FileSource file(key_file, true);
> +		RSA::PrivateKey key;
> +		ByteQueue bq;
> +
> +		// Load the key
> +		file.TransferTo(bq);
> +		bq.MessageEnd();
> +		key.BERDecodePrivateKey(bq, false, bq.MaxRetrievable());
> +
> +		// Write the modulus
> +		Integer mod =3D key.GetModulus();
> +		for (int i =3D 0; i < mod.ByteCount(); i++)
> +			modulus_buf[i] =3D mod.GetByte(i);
> +
> +		// Sign the message
> +		RSASS<PSS, SHA256>::Signer signer(key);
> +		size_t length =3D signer.MaxSignatureLength();
> +		SecByteBlock signature(length);
> +
> +		length =3D signer.SignMessage(rng, msg, len, signature);
> +
> +		// Copy in reverse order
> +		for (int i =3D 0; i < length; i++)
> +			sig_buf[length - i - 1] =3D signature[i];
> +	}
> +	catch(const CryptoPP::Exception& e) {
> +		cerr << e.what() << endl;
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +extern "C" int rsa_pss_sign_file(const char *key_file, const char *msg_f=
ile,
> +			unsigned char *sig_buf)
> +{
> +	try {
> +		AutoSeededRandomPool rng;
> +		FileSource file(key_file, true);
> +		RSA::PrivateKey key;
> +		ByteQueue bq;
> +
> +		// Load the key
> +		file.TransferTo(bq);
> +		bq.MessageEnd();
> +		key.BERDecodePrivateKey(bq, false, bq.MaxRetrievable());
> +
> +		// Sign the message
> +		RSASS<PSS, SHA256>::Signer signer(key);
> +		string signature;
> +		FileSource src(msg_file, true,
> +			new SignerFilter(rng, signer,
> +					new StringSink(signature)));
> +		int length =3D signature.length();
> +
> +		// Copy in reverse order
> +		for (int i =3D 0; i < length; i++)
> +			sig_buf[length - i - 1] =3D signature[i];
> +	}
> +	catch(const CryptoPP::Exception& e) {
> +		cerr << e.what() << endl;
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> diff --git a/src/rsa-pss.h b/src/rsa-pss.h new file mode 100644 index
> 0000000..39e88c0
> --- /dev/null
> +++ b/src/rsa-pss.h
> @@ -0,0 +1,46 @@
> +/*
> + * Copyright (c) 2015-1016, Avionic Design GmbH
> + * All rights reserved.
> + *
> + * Redistribution and use in source and binary forms, with or without
> + * modification, are permitted provided that the following conditions
> + * are met:
> + *  * Redistributions of source code must retain the above copyright
> + *    notice, this list of conditions and the following disclaimer.
> + *  * Redistributions in binary form must reproduce the above copyright
> + *    notice, this list of conditions and the following disclaimer in th=
e
> + *    documentation and/or other materials provided with the distributio=
n.
> + *  * Neither the name of Avionic Design GmbH nor the names of its
> + *    contributors may be used to endorse or promote products derived
> + *    from this software without specific prior written permission.
> + *
> + * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS'' AND
> ANY
> + * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
> THE
> + * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
> PARTICULAR
> + * PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER
> OR
> + * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
> +SPECIAL,
> + * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
> LIMITED TO,
> + * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
> DATA, OR
> + * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
> THEORY
> + * OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
> + * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF
> THE
> +USE
> + * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
> DAMAGE.
> + */
> +#ifndef _RSA_PSS_H
> +#define _RSA_PSS_H
> +
> +#ifdef __cplusplus
> +extern "C" {
> +#endif
> +
> +int rsa_pss_sign(const char *key_file, const unsigned char *msg,
> +		int len, unsigned char *sig_buf, unsigned char
> *modulus_buf);
> +
> +int rsa_pss_sign_file(const char *key_file, const char *msg_file,
> +		unsigned char *sig_buf);
> +
> +#ifdef __cplusplus
> +}
> +#endif
> +
> +#endif // _RSA_PSS_H
> --
> 2.7.2
>=20
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in=
 the
> body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org More majordomo info at
> http://vger.kernel.org/majordomo-info.html

--_002_fbd256251e014b23a189337a7d251da0HQMAIL103nvidiacom_
Content-Type: application/octet-stream; name="sign-t124-bl.sh"
Content-Description: sign-t124-bl.sh
Content-Disposition: attachment;
	modification-date="Mon, 29 Feb 2016 22:24:22 GMT";
	creation-date="Mon, 29 Feb 2016 22:24:22 GMT"; size=2692; filename="sign-t124-bl.sh"
Content-Transfer-Encoding: base64

IyEvYmluL2Jhc2gKIwojIENvcHlyaWdodCAoYykgMjAxNSwgTlZJRElBIENPUlBPUkFUSU9OLiAg
QWxsIHJpZ2h0cyByZXNlcnZlZC4KIwojIFRoaXMgcHJvZ3JhbSBpcyBmcmVlIHNvZnR3YXJlOyB5
b3UgY2FuIHJlZGlzdHJpYnV0ZSBpdCBhbmQvb3IgbW9kaWZ5IGl0CiMgdW5kZXIgdGhlIHRlcm1z
IGFuZCBjb25kaXRpb25zIG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSwKIyB2ZXJz
aW9uIDIsIGFzIHB1Ymxpc2hlZCBieSB0aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLgojCiMg
VGhpcyBwcm9ncmFtIGlzIGRpc3RyaWJ1dGVkIGluIHRoZSBob3BlIGl0IHdpbGwgYmUgdXNlZnVs
LCBidXQgV0lUSE9VVAojIEFOWSBXQVJSQU5UWTsgd2l0aG91dCBldmVuIHRoZSBpbXBsaWVkIHdh
cnJhbnR5IG9mIE1FUkNIQU5UQUJJTElUWSBvcgojIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQ
VVJQT1NFLiAgU2VlIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IKIyBtb3JlIGRl
dGFpbHMuCiMKIyBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2Vu
ZXJhbCBQdWJsaWMgTGljZW5zZQojIGFsb25nIHdpdGggdGhpcyBwcm9ncmFtLiAgSWYgbm90LCBz
ZWUgPGh0dHA6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgojCiMgU2VlIGZpbGUgQ1JFRElUUyBm
b3IgbGlzdCBvZiBwZW9wbGUgd2hvIGNvbnRyaWJ1dGVkIHRvIHRoaXMKIyBwcm9qZWN0LgojCnNl
dCAtZQpJTUFHRV9GSUxFPSQxCktFWV9GSUxFPSQyClRBUkdFVF9JTUFHRT0kSU1BR0VfRklMRQpD
T05GSUdfRklMRT1jb25maWcudG1wCgpDQk9PVElNQUdFPS4vY2Jvb3RpbWFnZQpCQ1RfRFVNUD0u
L2JjdF9kdW1wCk9CSkNPUFk9b2JqY29weQpPUEVOU1NMPW9wZW5zc2wKREQ9ZGQKUk09cm0KTVY9
bXYKWFhEPXh4ZApDVVQ9Y3V0CgplY2hvICJHZXQgYmwgbGVuZ3RoICIKQkxfTEVOR1RIPWAkQkNU
X0RVTVAgJElNQUdFX0ZJTEUgfCBncmVwICJCb290bG9hZGVyXFswXF0uTGVuZ3RoIlwKIHwgYXdr
IC1GICcgJyAne3ByaW50ICQ0fScgfCBhd2sgLUYgJzsnICd7cHJpbnQgJDF9J2AKCmVjaG8gIkV4
dHJhY3QgYm9vdGxvYWRlciB0byAkSU1BR0VfRklMRS5ibC50b3NpZywgbGVuZ3RoICRCTF9MRU5H
VEgiCiRERCBicz0xIHNraXA9MTYzODQgaWY9JElNQUdFX0ZJTEUgb2Y9JElNQUdFX0ZJTEUuYmwu
dG9zaWcgY291bnQ9JEJMX0xFTkdUSAoKZWNobyAiQ2FsY3VsYXRlIHJzYSBzaWduYXR1cmUgZm9y
IGJvb3Rsb2FkZXIgYW5kIHNhdmUgdG8gJElNQUdFX0ZJTEUuYmwuc2lnIgokT1BFTlNTTCBkZ3N0
IC1zaGEyNTYgLXNpZ29wdCByc2FfcGFkZGluZ19tb2RlOnBzcyAtc2lnb3B0IHJzYV9wc3Nfc2Fs
dGxlbjotMSBcCiAtc2lnbiAkS0VZX0ZJTEUgLW91dCAkSU1BR0VfRklMRS5ibC5zaWcgJElNQUdF
X0ZJTEUuYmwudG9zaWcKCmVjaG8gIlVwZGF0ZSBib290bG9hZGVyJ3MgcnNhIHNpZ25hdHVyZSwg
YWVzIGhhc2ggYW5kIGJjdCdzIGFlcyBoYXNoIgplY2hvICJSc2FQc3NTaWdCbEZpbGUgPSAkSU1B
R0VfRklMRS5ibC5zaWc7IiA+ICRDT05GSUdfRklMRQplY2hvICJSZWhhc2hCbDsiID4+ICRDT05G
SUdfRklMRQokQ0JPT1RJTUFHRSAtcyB0ZWdyYTEyNCAtdSAkQ09ORklHX0ZJTEUgJElNQUdFX0ZJ
TEUgJElNQUdFX0ZJTEUudG1wCgplY2hvICJFeHRyYWN0IHRoZSBwYXJ0IG9mIGJjdCB3aGljaCBu
ZWVkcyB0byBiZSByc2Egc2lnbmVkIgokREQgYnM9MSBpZj0kSU1BR0VfRklMRS50bXAgb2Y9JElN
QUdFX0ZJTEUuYmN0LnRvc2lnIGNvdW50PTY0ODAgc2tpcD0xNzEyCgplY2hvICJDYWxjdWxhdGUg
cnNhIHNpZ25hdHVyZSBmb3IgYmN0IGFuZCBzYXZlIHRvICRJTUFHRV9GSUxFLmJjdC5zaWciCiRP
UEVOU1NMIGRnc3QgLXNoYTI1NiAtc2lnb3B0IHJzYV9wYWRkaW5nX21vZGU6cHNzIC1zaWdvcHQg
cnNhX3Bzc19zYWx0bGVuOi0xIFwKIC1zaWduICRLRVlfRklMRSAtb3V0ICRJTUFHRV9GSUxFLmJj
dC5zaWcgJElNQUdFX0ZJTEUuYmN0LnRvc2lnCgplY2hvICJDcmVhdGUgcHVibGljIGtleSBtb2R1
bHVzIGZyb20ga2V5IGZpbGUgJEtFWV9GSUxFIGFuZCBzYXZlIHRvICRLRVlfRklMRS5tb2QiCiRP
UEVOU1NMIHJzYSAtaW4gJEtFWV9GSUxFIC1ub291dCAtbW9kdWx1cyAtb3V0ICRLRVlfRklMRS5t
b2QKIyByZW1vdmUgcHJlZml4CiRDVVQgLWQ9IC1mMiA8ICRLRVlfRklMRS5tb2QgPiAkS0VZX0ZJ
TEUubW9kLnRtcAoKIyBjb252ZXJ0IGZyb20gaGV4ZGVjaW1hbCB0byBiaW5hcnkKJFhYRCAtciAt
cCAtbCAyNTYgJEtFWV9GSUxFLm1vZC50bXAgJEtFWV9GSUxFLm1vZC5iaW4KCmVjaG8gIlVwZGF0
ZSBiY3QncyByc2Egc2lnbmF0dXJlIGFuZCBtb2R1bHVzIgplY2hvICJSc2FQc3NTaWdCY3RGaWxl
ID0gJElNQUdFX0ZJTEUuYmN0LnNpZzsiID4gJENPTkZJR19GSUxFCmVjaG8gIlJzYUtleU1vZHVs
dXNGaWxlID0gJEtFWV9GSUxFLm1vZC5iaW47IiA+PiAkQ09ORklHX0ZJTEUKJENCT09USU1BR0Ug
LXMgdGVncmExMjQgLXUgJENPTkZJR19GSUxFICRJTUFHRV9GSUxFLnRtcCAkVEFSR0VUX0lNQUdF
CgojIGVjaG8gIkdldCByaWQgb2YgYWxsIHRlbXBvcmFyeSBmaWxlczogKi5zaWcsICoudG9zaWcs
ICoudG1wLCAqLm1vZCwgKi5tb2QuYmluIgokUk0gLWYgKi5zaWcgKi50b3NpZyAqLnRtcCAqLm1v
ZCAqLm1vZC5iaW4KCg==

--_002_fbd256251e014b23a189337a7d251da0HQMAIL103nvidiacom_--
