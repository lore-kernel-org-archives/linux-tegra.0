From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH v1 5/8] Fix some issues found in libmcrypto
Date: Mon, 21 Sep 2015 16:08:43 -0600
Message-ID: <56007FEB.7010408@wwwdotorg.org>
References: <1441228760-26042-1-git-send-email-jimmzhang@nvidia.com>
 <1441228760-26042-6-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441228760-26042-6-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/02/2015 03:19 PM, Jimmy Zhang wrote:
> Libmcrypto can't be used without these fixes.

This patch should appear immediately after the patch which adds 
libmcrypto into cbootimage then, before any patch that starts using it.

Have you sent these patches upstream for inclusion in libmcrypto?

Some description of the fixes and justification for them should be 
included in the commit description.

> diff --git a/src/libm/bigdigits.h b/src/libm/bigdigits.h

>   /* Define type of DIGIT here */
> -typedef unsigned long DIGIT_T;
> +typedef unsigned int DIGIT_T;

I wonder if this is running afoul of 32-bit-vs-64-bit system 
assumptions? Does this e.g. fix the build on 64-bit but break it on 
32-bit? What symptom does this solve? Would it make sense to typedef to 
e.g. uint32_t if a specific size is required?

> diff --git a/src/libm/common.c b/src/libm/common.c

> @@ -46,11 +46,11 @@ void mcrypto_dump(char *desc, BYTE *p, UINT len)
>   #ifdef MCRYPTO_DEBUG
>   	UINT i = 0;
>   	
> -	printf("[%s]\n", desc);
> +	printf("[%s(%d)]\n", desc, len);
>   	while (len--) {
>   		if ((i % 20) == 0 && i)
>   			printf("\n");
> -		fprintf(stderr, "%02x ", p[len]);
> +		fprintf(stderr, "%02x ", p[i]);

While perhaps a valid fix, that looks like debug spew cleanup, so not 
strictly "required".

> diff --git a/src/libm/mpModulo.c b/src/libm/mpModulo.c
> index c929dd5a2c02..cff60d173e8b 100644

> +/* TODO: add support for MCRYPTO_BARRET */
> +#define MCRYPTO_TRIVIAL_DIVISION

The libmcrypto Makefile implies this should be solved by adding 
-DMCRYPTO_TRIVIAL_DIVISION to the build command-line instead.

> diff --git a/src/libm/mpMultiply.c b/src/libm/mpMultiply.c

> +/* TODO: add support for MCRYPTO_FFT_MUL */
> +#define MCRYPTO_SCHOOL_BOOK

Same here.

>   int mpMultiply(DIGIT_T w[], const DIGIT_T u[], const DIGIT_T v[], UINT ndigits)
>   {
> -#ifdef MCRYPTO_SCHOOL_BOOK	
> +#ifdef MCRYPTO_SCHOOL_BOOK

Unnecessary whitespace change.

> diff --git a/src/libm/pkcs1-rsa.c b/src/libm/pkcs1-rsa.c

> +/* cbootimage header */
> +#include "crypto.h"
> +
>   /* Internal Functions - Forward Declaration */
>   static void memxor(BYTE *c, BYTE *a, BYTE *b, UINT len);
>   	/* Perform c = a XOR b */
> @@ -59,6 +62,15 @@ static int GenRsaPrime(DIGIT_T p[], UINT ndigits)
>   	return 0;
>   }
>
> +static
> +UINT SwapBytesInNvU32(const UINT Value)
> +{
> +    UINT Tmp = (Value << 16) | (Value >> 16); /* Swap halves */
> +    /* Swap bytes pairwise */
> +    Tmp = ((Tmp >> 8) & 0x00ff00ff) | ((Tmp & 0x00ff00ff) << 8);
> +    return (Tmp);

No need for ().

Does "NvU32" refer to the NvU32 type? That's not something that should 
exist within libmcrypto since it's not NV-specific code.

> @@ -91,8 +103,8 @@ static int MGF1(UINT hid, BYTE *seed, UINT seedlen, BYTE  *mask, UINT masklen)
>   		
>   	for(i=0;i<n;i++) {
>   		/* Constructing Hash Input */
> -		memcpy(data+seedlen, &i, 4);
> -		
> +		*(UINT *)(data+seedlen) = SwapBytesInNvU32(i);
> +

Why?

> @@ -113,7 +125,6 @@ static int MGF1(UINT hid, BYTE *seed, UINT seedlen, BYTE  *mask, UINT masklen)
>   }
>
>   /* Main Functions */
> -
>   int PKCS1_RSA_GenKey(PKCS1_RSA_PUBLIC_KEY *spk, PKCS1_RSA_PRIVATE_KEY *ssk, UINT mod_len)

Unrelated whitespace change.

> @@ -511,14 +522,19 @@ int PKCS1_RSASSA_PSS_SIGN(PKCS1_RSA_PRIVATE_KEY *ssk, UINT hid, BYTE *m, UINT ml
>   	em = (BYTE *)malloc(NBYTE(ssk->len));
>   	
>   	/* PSS Encoding */
> -	if((ret=PKCS1_EMSA_PSS_ENCODE(hid, m, mlen, slen, em, NBYTE(ssk->len)))!=ERR_OK) {
> +	if((ret = PKCS1_EMSA_PSS_ENCODE(hid, m, mlen, slen, em, NBYTE(ssk->len)))
> +				!= ERR_OK) {

Unrelated whitespace change.

>   		free(em);
> +		printf("Error: encoding failed\n");
 >   		return ret;

Why? The code already returns an error, and a library really shouldn't 
be spewing error messages over stdout unless asked.

> +	SwapEndianness(em, NBYTE(ssk->len), em);
> +	mcrypto_dump("PSS_SIGN: Encoded Message", em, NBYTE(ssk->len));
> +
>   	/* Signing */
>   	ret = PKCS1_RSASP1(ssk, (DIGIT_T*)em, (DIGIT_T*)s);
> -	mcrypto_dump("Signature",(BYTE *)s, NBYTE(ssk->len));
> +	mcrypto_dump("PSS_SIGN: Signature",(BYTE *)s, NBYTE(ssk->len));

Why?

> +/*
> + * hid: hash id
> + * m:   message buffer
> + * mlen: message length
> + * slen: signature length
> + * em:   encoded message   (from hash)
> + * emlen: encoded message length -> 256
> + */
>   int PKCS1_EMSA_PSS_ENCODE(UINT hid, BYTE *m, UINT mlen, UINT slen, BYTE *em, UINT emlen)
>   {
>   	/* PSS Encoding */
> @@ -568,31 +592,34 @@ int PKCS1_EMSA_PSS_ENCODE(UINT hid, BYTE *m, UINT mlen, UINT slen, BYTE *em, UIN
>   		return ERR_UNKNOWN_HASH;
>   	
>   	/* Computing Hash of m */
> -	mcrypto_dump("PSS Encoding: Message", m, mlen);

Why?

>   	H = (BYTE *)malloc(hlen);
>   	if((ret = Hash(hid, m, mlen, H))!=0) {
>   		free(H);
> -		

Unrelated whitespace/formatting change. There are others too, but I 
won't call out each individually.

>   		return ret;
>   	}
>
>   	mcrypto_dump("PSS Encoding: Hashed Message", H, hlen);
>   	
> +	/* BUG FIX */
> +	/* slen is 256 that causes the condition below failed */
> +	/* FIX: set slen to hash length */
> +	slen = hlen;
> +

slen is a parameter to this function. Why not just pass the correct 
value to the function?

>   	/* Length checking */
> -	if(emlen<(hlen+slen+2)) {
> +	if(emlen<(hlen+slen+2)) {  /* emlen: 256, hlen: 32, slen: 32 */

Are those values always true for /any/ use of this function?

>   	/* Generating salt and constructing M */
>   	salt = (BYTE *)malloc(slen);
> -	GenSeed(salt, slen);
> -	mcrypto_dump("PSS Encoding: Salt", salt, slen);
> +	/* GenSeed(salt, slen); */
> +	memset(salt, 0xFF, slen);

This looks like a hack for some specific use-case. We shouldn't change 
the semantics of libmcrypto in this way.

> @@ -629,11 +656,18 @@ int PKCS1_EMSA_PSS_ENCODE(UINT hid, BYTE *m, UINT mlen, UINT slen, BYTE *em, UIN
>   	mcrypto_dump("PSS Encoding: maskedDB", maskedDB, emlen-hlen-1);
>   	
>   	/* Constructing encoded message, em */
> +	maskedDB[0] &= ~(0xFF << (8 - 1));

Why?

>   	memcpy(em, maskedDB, emlen-hlen-1);
>   	memcpy(em+emlen-hlen-1, H, hlen);
>   	em[emlen-1] = 0xbc;
> -	mcrypto_dump("PSS Encoding: Encoded Message", em, emlen);

Why?

> +	/* added: free memory H, M, DB, ... */
> +	free(H);
> +	free(M);
> +	free(salt);
> +	free(maskedDB);
> +	free(DB);

That comment doesn't add any useful information.

> -int LoadPublicKey(char *fname, PKCS1_RSA_PUBLIC_KEY *spk)
> -{
... (entire function body removed)
> -}
> -
> -int LoadPrivateKey(char *fname, PKCS1_RSA_PRIVATE_KEY *ssk)
> -{
... (entire function body removed)
> -}

Why?

> diff --git a/src/libm/pkcs1-rsa.h b/src/libm/pkcs1-rsa.h

> -#define PKCS1_MAX_LINE_LEN	346	/* for reading parameter file */
> +#define PKCS1_MAX_NUM_KEYS	8	/* number of key components */
> +#define PKCS1_MAX_LINE_LEN	512	/* for reading parameter file */

PKCS1_MAX_NUM_KEYS doesn't seem to be used anywhere.
