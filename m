Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794775561;
	b=B46C+2iC1bUFFLxuZbfg2U9gP8BNffzG15gudqeTjobq09G6bFH6tKL4bJ4358Weo9KD
	 oi7amUwJEVneL4rS1KQAYip1PyVBQSPBdWQx1mG+23ZCCfzXxSALwURqYHsw90dMWRUNB
	 /FkMPwQY1G90xj/FJQ5/AfFLgWpKO2rbfBfiJJag2rl6zH1CqS1cXx3rrLji9/hffH9F7
	 N9gxLDVR+YC0weJluBxtK0yocW0hnqqdcIb3LzCAGdbKmVVuCGvPK7x7jW9/TS+ZFV65O
	 zsW45OEuI5sYSpeyMoTGBralrBNiWMtkXxcaROaSRxknGU4LLEX7G9rXnb/Z+qhSvXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794775561;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=r5HTsltN3qKXHfYcwhZ0ejh/zJWetlORYjdsSgckopE=;
	b=tnpVGxNyspOyiQzEQUwsl+xJN8hm5JpMJL0oDiewkSAcnWV1i9pQVLLRNN4y+2QMFLWw
	 j6gXZTsZ3YE9PzUj8ADvB5NVmgov1B4bnA0sHU4Knq7y942Q3Tu7mqE1U8conYg1R3cFk
	 5Zuz4rWuhoAzkTWUG4UMBAbkf+r+F/h5Ru0uVuhJYRpJpyK0kv7LlaGzJnWXbvQwX7lmw
	 vhquLt/QhZCpGIGSz+o2RM6xzWWVRowAikQ4ee0UA0FJnGFo7QgMJsvmtw78FuXTIIv9D
	 E4hTz9sObi/shzPgNFsXbtlr6B0MBhFYxGbgKNs+PYZO6kJYE5CIiagrKDFNd/H5r8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=g0pGVGqQ;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 386CE606A335
	for <linux-tegra@vger.kernel.org>; Sun, 15 Nov 2026 20:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 386CE606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=g0pGVGqQ
DKIM2-Signature:  i=1; m=1; t=1794775558;
 mf=PG1hcnZpbjI0QGdteC5kZT4=;
 rt=PGxpbnV4LXRlZ3JhQHZnZXIua2VybmVsLm9yZz4=;
 d=gmx.de;
 s=s31663417:rsa-sha256:Gr1g+6KlDSpViKq2lHiFOMECRjLj
   +jSJoDzhlUL7fKnA1Ews3ecnbE2Un4v1MKpBZNGyxujWQFDxTiarhE7/VCns/JexHIjaUVT/wCv
   dXinfI+tJSgwmUBV/++qtm8a7avdQyWUwawHyMGqkvWMIr3Er1HQ4uRdwg4qs4todfj5fhxPm21
   /O9VtDWY0J4ibAkmnnkiG2VUov+oWZXvbuK5v26ruMocmADmLhgHBxE//zBitajV4RTIbdAeQgs
   1vP7ywqjVHkO9JTORaVctt36a2BoQERMzfHEPiw201KP0yyOx9UhuoAqo3HYXWB5DjFXhgL8iTu
   jiby72H34xD0BQ==;
Message-Instance:  m=1;
 h=sha256:
   bAnyGu1IiZR7qagn2ddH+pq2Z5jQsYGII7HM0S48U9w=:
   Lb7Gnm9dTep3Rmpj+BZVhCNO8P3lHu7s/GqnV1VxBZI=,
  sha512:
   dyzqpZt01hGD1Kf21Dtk/yNsqNnkM0MPe90es5kjlU/k2b2sWc1zTTZMsH36nUrtPvBtXDX4EdZwC8SZKWbBGQ==:
   XrZdonzAGX/dOfNOuB8yYlrftNGMUcXrNjRI7NNVejxoXqiN+OePgJuwQUum9qFS9IfcUEAWQq7RQFW1ORfznA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794775533; x=1795380333; i=marvin24@gmx.de;
	bh=r5HTsltN3qKXHfYcwhZ0ejh/zJWetlORYjdsSgckopE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=g0pGVGqQNEawv4HJz2Sty1XaOzJwd7ptI+QfDX3+xj1eeHbKpz/3n5hTv5Xn1AbO
	 vAJ+2f5NGkm3GdnuiJXgjhM6LX8E9+Kup+JqC9O+nadhRgykCcKwe+mGDUa34E0qC
	 TPys2gQK1OdChgNLTsY57wVARGrLjG8tDcjATSfw7eKbwslqumLQsgS2/UWi6BN9i
	 pN9uvlpe17OydFQSvYCaFlhDGV/Ix5LyP8ZLrEzE4zuTGq7O+Ksr5iT7qRrkVepPK
	 PqLa1Gb7LAVf20IUQHhh+UAPP5WSBl/GFbG6Y6CAcfzAmDMnvFAfRMAUnqdyNY1c7
	 yW9SyhnLIMcu/gKxEg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N8GMk-1wOvAD20bA-012nCg; Sun, 15
 Nov 2026 21:45:33 +0100
From: Marc Dietrich <marvin24@gmx.de>
To: linux-tegra@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Marc Dietrich <marvin24@gmx.de>
Subject: [PATCH v2 1/2] dt-bindings: i2c: Add Tegra20 I2C target controller
Date: Sun, 15 Nov 2026 21:45:21 +0100
Message-ID: <20261115204522.360063-2-marvin24@gmx.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115204522.360063-1-marvin24@gmx.de>
References: <20261115204522.360063-1-marvin24@gmx.de>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:c8gOTKzplcBZNfI/YcM1AvR2IotD2zAupLJSmNmWvqZH5ca/Jnj
 G6G45TldoV2CsKD/CU/1hCYu+db3imqu3BDnJrFUgMkqRgaY1z/IMdc/62ZdCHLkLW/iGwn
 yRn4WiX7RlQlMGOuHHUeF8X+Qs6duBhMyXrHGuZzqz4EpVMLcXAQz2345Ddu1kcDPEkT3JE
 o3OvFN9ey+8BGzBbNesFg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:n8pdtzEe+II=;9ksKAa3n79MTaDLsaWMr+u2KWlB
 AG3HJd31GO6N6eed5BNRMke9l/OOuJMO+S5gTBoNWf1iyydJrejjnQTQuFBSSbLAiOB3Jk6iK
 Rgnc4r1rQgTYVRyMvO4TJbd5j0UyqQlZxi3lpjELASz5h/e0VKxcr7bAnIXkrBrljfnqm1FkQ
 7sL041M94EBIasy2Z8N7aBGxuggxr2+aQOYl3IdqPvKWOSUAwWPITfBwd/lRZuQtvi+sCGRoY
 vVtdOJDHO9VhVLBWwOIAk1JM03wEEMMojzGqD7dBPaGX5q4i9vZM91aWuUFDpPs/wzi02BI3I
 zbZ0JoNl8F9tO0UQczbusDUblwHO+vHZ/zhP7l9uEE5yjhaMJaTa6ucEj+G8+CteTabKGfPsr
 3H74NSs3vs2+SAVmtggA9yT0zZy0n1iQiitS7gKM6Gp2zYKBLG5xjhHzSz5nft4uxV48ypOt/
 Cjw9TBFauE4Wr8pF13brgbkhd5TbqwdmWaI+NGNLiJqCoesGrwfKqZMOZ8d/uMYZpOetSBfSd
 ICl04DdpCEt1xsxCtXMniTRUncWpJz4GWfVqmOBEf+hheOZCgDwO5RGsm/3b8v2+v0Krw5oii
 hJTA+j8pQmSwJEdsq28nOt2vX49+cd4LisJGDIRHbLBOQpfqPRKeyMsKnw6uMpCu0rHW53bog
 JTKRz2Ebn8L8NcJ3I5tfNfjTqWiV+jMm4rp+dhthMr/Kv8obb8Lv4yPPrjBRLml52wAhDs6tN
 iJY3WtT9d0eUiXgN7jdCs/zCMYmTFPpjJZChJzZZuuVsAQTNzS0FbiAHpgLR/EPWmnc4iobNj
 5z+d+a2ZpMGm8gsIZzifUiH3Qnnwqy0Wcybme4a/huUiFi54tMWCZNchsldGjKgZVsdilrA0M
 RcK+pWmzqjrWCf9lqPgoZb9lVbcX4a3aB0Pa19pHed02niIyTfDgxd8RONdAItZiRv2vKfxWr
 FzWqpqYSfbIj22YUn17BabUDBTo7z3Vj4x87TSnok01iZLpkNusoxhw4WpV4T4CsJMir+yWWL
 BhBM0FQZCcPuN4zzqW9M0hKUFVM8rVuG1bIwLDoMwtRFJ3lETGKqptEPFquz4lesUEulV2fkv
 579GB3fLHf03qgM51q5jDLhIQG6DwB1F4OK98hbAfDSWzBT3AzC9BO/SijawJ7ZryVp7DrDKv
 hRPF4v6dip/xytTtMpbf7mpT2bZmkLk1qcRzg9KQsJeKNqyEWZ+Ke8BO5V1FJkE+O3l1oY7mg
 PQ8q1KzMHAScRJZNzXvVI4mN+WpHrKLSIo2+NmultH1eGvO0CyJ/aytTRb1LNEqp8vcvY54LX
 LeaTZFA57mMNxavFmN24TqnxptFNCptcYGGE9omVKDfKh4wpl1XbI7Iy3qwQinHlFBgYu24mo
 6EHIum4hUOqfpEDi7frMffCSbgiXZYDceXjuFX+l/48TGWLq3MQqt5kMrHjzeSauVOCLgBVJr
 CICkYUvvTeagvjS5MJXNBxeRDzF4kYOXn1ywNBZARDLC8Udt8mdHYsHXp7KSixxFtBulBoxES
 iofacWN9r4nd8uvRV7bljXmCrd65L6h7rgB8rfbzFJlznBnhXA7Y1FX8g1moizLOeOrG8AZDT
 0FUokopP5ao+qBi/JqTiUfvKhLFednI46zN19mw1H3DRkA5EEwNnUPNR+5Pfnyy7KeGwFKOyi
 flo1KNjN0+gla4Feap9mUraRW3zRkzyeWEfxXeBJFmFRLHNI12O75z5WypxMokvtQaQMQf4MB
 3XjQnCjNlpxqk86oPWcfrEIMvKdT0xYO8k+66XtKwVMFNIL6PD+C7bRbgZ1ZVf7JYGVKbR7Ox
 iaokBa8/y+ECRs7HeEMiNjKTdCyuiAvVtzUDiHUEHLlnAlNqIq4KVxC0M0Uie1YLGVmtNqzeT
 /e8+fZYzOD4bTUz/5zyYKJ8rV5nSBIMTn0d6j9N1ROGj8u49/F6JWdAiWpLTAQgzSaAm6FHzL
 ppikMtxnudn/3HbR1XLULVpgBDVlON8bPGDnNZE7YjSMNblSj5wiuZb8LmmwF5UTJwhD1iKIi
 RTEd8jv6Ba+L0ie7GDkzLz8Qklppw2gjp+vsHQMA2nGRErrAmzyvwvsLKC2LvzlEoI3VsC2zE
 fypOfCKnR15kHh9UYYoWnfonMLPaHdiKWz9G1eNZEJaAzm9mD7cUuT+Xb1/QuArLsa7tl2aGP
 eF1qkrkoaG1X9v4IHxPA50auZJb110wD2kBS93SFQJXpZG5ipM++h+PgTUbZ8w0kHi/GARReu
 RXbr/GPiDLJEXdgysJcUcuQhBJqZE3hVebYLL2SFqFoFOmxhNIeuHbKzTNyYVQaoFqxVSjR1Q
 SgvpFc/OcmBwfmQU4s17bNgEF44jSJPWDjKRvq3UFWub7vd0NQQcZUhJv7igrpfQ6UsR5XkXb
 KjWCRsyIy9cjZtBvBr3FDVznptS36D+rs55rAaMkWyJy8jRb1YdeIVox5FhK/AQcGS9bUO98b
 MOiokCF5/FMdYFGJvVlJksyym7S7xgrlXM89yilOaor+4OoMvkqAgaWtgy3GgE/T7+r0VsblA
 k8hmNlVeY3iYtZHpchdfrmCmaytoyVZ44AmIzEaABptguOJiFStvk/JfIFxrv9peVTTttRuLJ
 /RsqZXz9VtPZafqJTMBW732GtBObKXMP5bgJ2soq/mak75n/DSTLCxG1hlYDDNNx3SaiESTDM
 opMOuQgXtAHiEX5uBipFbuAFBCQh1QMLRPyquX8pJo817P2U3vTm0Dn6cNSScTzbJygwuf5C/
 YKLhkSRQRyNwIm+LsOM+aA5cENuqIZVIXIwJ+y4JdvX6n4BEfKnAk5BEfBQJ8jwwejADW2mg2
 lz3U7z6+bUTt4f5OnQxXSUNthpmDV+CJH6lnHzGYVu8hmOXUt/pomkWsQIFkZ5Bo0snIrLAG/
 CJp3UozGn3z3FiD0aJDwnIZO2XPvOvdR15IFNS9whbtvyyWKVAx+vNnJgSdGQaNe7pmWDHT3A
 W4oJ2tbUjvEz76qkxWzevlJxNCfTuVn/Ykm6/3i4/8llRQaaLPXOwSQRUDkF/KhmkJOOgLJVv
 SRDXrdv8sn/8ZA9x4qQoZk9XlmWUY/TixtYau7YzNn7Ci7f8mEgmjj/dPBOo8JhsFhRSayJkA
 2/IJ6utUV14Ri8yrm8jGJG06fhZ4WR4+L6TZKDsjc+0YAEWPeEgSEcHrDZoJG/sQnkRkniswK
 aTaRq3qSPRMvOpXf/C6ds8aA6P9xxYeED7WXGFglUm5gwN+Hq2egyfMC9jMgKbma2uC5LXr0f
 gixGJOsJrF1S0TbvkmjIUCvLR3/8cW57ErY4B4W6ND28oPZCk3jVUf72+MS/Jz2EJmr92xDb4
 ahfXaR/HtSzQx1KuLLwxFLAeKu8DVQXoqZIXWEQHghvBiiw7it739i51/85NM5IBV1BHCs8el
 S7jiQBROR1KNfeTFSyb5x1vKr7QFpkypduDNQUPS8vqfQVMS87FbSf5QD2LQsMr3wZlYrj/+A
 vNUzp7Dwru9+MjnCs2uqwrUgkXtk/8qEDYfu4We3FXgvX7dd2RH97Zt+v08cpDicIiPQZ2OVI
 8BWrq3vQ1zIEEf1UG+/dipboiw/w49WTm9va9ugas29vbqdxDe3c0CuBbA2y63q/lakvBldT0
 VSku5G9G8+1kJwgbRiBwRgCAcuhQ5TGXx/lr4NiECzVVOrKXJ0wFxXIsB81is9mHvRhEXDpTH
 dJzmIXqWnMBhHcFSX7w628urBf5iasbHt4J0Nv9bafmvFGnP6DI/68C4mNOfwKGri+wlTBci9
 otMFi2m9FBP80GsctlB+LOCVloH1dlvtGkQCq4ISY1OWp7Tu7k6YEcl33PHSU2qe6h3eyEDbn
 KYiWFFfvj0WuFmLXYfOMnJV1bvvr9I2aTxejSinrDloqvfW0FHFSlWRIf3AW5ZJsEp0Olrrmi
 xwlttoY1Mh/N6GYqqLm+P08SU4w4O9oqPtfQM1jVuE63Ty4a+lalIbNAF3cJsnPw1ljzcQHht
 WiXPBuzaVwRjiUdvjwz+8FhbnkSl8dsE2Qtm3FQNXtXmr4ug1blqggAqdzFi7pOVQbWg2IhIn
 V8X0l+4EZh+Vmn7j1WeIH2iPWEjdyMBAuXg1rhxVSNUepq0nS6jMcL86m09YPvfCw2WFTiq03
 nNqlI2m5TvXF+ylfoUV3Igymj6yIvQzRuPw3ItFwboW5g9Pgj8jT+EvaGyiNGaBamTLLTTtsV
 wC8pSRk2sTMUJBnoN5FkMhX8dBQVEIMeEa79Um2v6A9kU36OwdzS2jdzB8GBEOERtDvcPCkht
 JhKeFvRgfW2gxjdcPZJwpcGpLtPj31HZEpv4KL+ZoQz8xO1euyPTvheQ9gEsbGBhCwoks8S7f
 XiFnj+LGevkx5T2sF3yCEq2XWTLO/0lCgj1joUcyZyyTFoEAcV+L12YPIxEnHfch8W+2FKuTJ
 ouDfQ90Lhq7NEWE3M72vlYmSgTXN8LfBEXr2iS8QHz1xGtUjzLN6EIju2/OxKfxRuH7W3PEBz
 fcDNDie4E1cJWmO+BBnhUarW6oXDuZSpvcSL2P2f+SF8Q7NNhxK1Xcr7xQIg+6WLdL/kkOMOe
 sbokkVnz37vR0kXvXSpm1B9mjqgExtIwHYcIXxL0WvkPlgXBLrfwiG4SlSFILCuMLzkr9YrHc
 L/T/7Qjax6j9NH68b20tNToaUKH/B5SiPw45RktwO1W1viF8XHev+W/iJeafpmH2Hj1qMavw4
 anwmbACQUYtE5WyX0WY1YvZMgznnv9q8svzdmAgNWMEUybpcfrKUzvLOxeB/unJlx19EyWwdc
 eticucL/Y1abUegGw9wBV4rL7MWc8cDZZDIq7ya+yv5v+sCwHF7UxvOOGI7+a6CnZyZKofiPk
 ZvNBxCEQYTIiR2i2vM90TUKXJi2WaqqrSwuJW3dQPiHqWR/uOwWZ7/GFDKglmXpkDLj9iE0Lz
 tWocmx1J994KQvQpMuOLzuj+83qgzaABKkbSDcYxrGyRTE6HpRfPCa7PHzx6OjCCXO5eX0UfB
 tWKhdw4h/yoGkWtuPxilVqIwiwYpalYs4Fm7zYeNmwSx2OKF/NRsfbExbBFAw2xew2Tlbl4fp
 JkUAQq9p9CR9u8U9DiCDBurygLUBEZ4eHEybCBEEBFSe6DJqqgBuK2zwzBtoBpusfosupWlCX
 dIAbjJDTlhvoHEP/QRKPK3U8VvFeUZ1RUBO7ALU2Wh6Irx7SyCr3uEIs9wXTn3kOwldHOHTy9
 socxWGbhnDEB3k9DhmBE4sbnFaZP9dPJ8+041gCru1PavUS6KJ7K8v+7ome1GeCcsySq2tWvg
 ETiidemvj0D0hNcyy3PdJB3MOtZEkH/rx0MBpMmehZ5gFxvl4W93TNktpa9QOrgNfiGibX6U6
 Nkz0lioXAsZvw54t2/4E4nBJHO1WGGJTJW2gMd8WK/jDDQpk/OLpo/P1RiNW+0tO8uNasb8cO
 Lk8QlHb8ByJD+HJEjtjogaNjSJTUNaN2IHVddj9FLwjJSzffi4TqkWt40cnqVlDmKo7vvm8wP
 rloONDweQBzSCaM5YvWFianExH501Y0FaDCasShXZhqE7JEkWfj4u782iZ/UVK/y/Ry5odjFW
 KT0RK3W/Ed/AEVuh2O/GDa2qyFg4EPjdaXcysspJLFAkBji+07tnjFOtXolmHp3ijIurjJSwn
 CoNhxZqNQyjKXX5GioUacDOblFUiIfjKM2hd+OSWIraPzFF2+X4FUmLLPo542FEf8gfjz9I2c
 pjRqvyU6Sc/ktXgQ0W5CGk0cQJ2WnwTzHtn+egYMfCu3OivztEyLP/W6z+O0iNRVTU4K0itTy
 H5/amwvKRKAFw8HHk420isMbyaHqvsztidUjG+tmEHf/2KLOIrFT3NRVGcwMt0Mit+OOqJAjS
 tAwkXn/K6fe4FMFdtX+qgDPhj4Dv/ri0cJzD46GJX1NBPMrddRix29Tg3kXxOKQRdKiAFlMJ7
 2mOjHj2cE8vjPSPUuaDJALrI9UNlmtbt1hqYgI7pW1iv7p6CqkW07HUun2v6MJ2/5wTS56zTp
 To4Pdno0jnRV6mE0rRW9xqifY2ddLwieASVOVSI+P0/lUWydJq7PaSHUsXhYtuRIu8OJAa5RU
 p9IbrnYyqqPzHgTWKYn4GIUb+UnHEIJv2uZaB0xS8+OfueRXwNop55NnNhynbLFtaG5Aatgrp
 6IZvhrrdSzN3rhf5RzmW+KpVmQ6o/Fz8w7zJ7AFUcD9cNbxyQ1TPybnHXqvqXRjrG0sOKjHBi
 m6zMpbz3o3Nps6Nv8imcTPKdzgpXmetah/IQTKmqWsF8O4W5DwuhHSa8vgqGLmv99OG6fEN8T
 UPWKllMZvFzOlfUInf9zzWW8DmX94LnbWZ6rf3fru5uRAeKJiuH0imZRw1qSOmnKeb5vgzErc
 nnss0ohk5ib1qzT7Ciq/TMuGQ0beP0COsOSuwN1yq1rb5jQSC0jFx7yZR8bPe1pSz00U0b8KV
 ecqWhChNaqPwcRO7yrw1WTlaMY2Q49wSHLDrrBcuIkBQp74ZlDE9Bnj5SBTZGK7NyjFC3V5/J
 Ho0VP64v02f2iPHWzV4ZN/x8McHVh3BHEBqrnJpDj/KsLEyw4YGH5tiOzqFCqwZ7Jfdr+2GLS
 Anfy8/cSRDwJDbd0sX4K8IWQelW3ERAjiVJZNQJcFFFlY89m/6FhOG7c2f+MgKo8eJmwlr9WW
 q0Zt3uihSCaHf/g7MqftNK4PWvzAVEO6UP8iNaM8l+TM7qT5lswhsr7pClnpj4RtqmUkMZLNb
 a2/tSLEwbOoy9nijIuqfJK1r7eu1Zqvj7p53mpODs8hycHTwSIllFh0HGDdWf8A4C6H+xSl6G
 RTQYdMd+QHnIz0b6ygYcuk0/fK1nH/M5LQme2aX2Q0oyCJV1rbxwWNd0XWTpWcA1JSRoYcsEh
 /ez1iHbySKrEXCAzZCstucEtM3B9p6wt+OByqcTXJhqQoQbLToglwt/TssGZ8Gw/joAliV8m9
 LOdjQx39CN3NvRyWhJoJQbrujWRhFs9zspcSEIl1mXmJlhj9oP1V6Kh5UU/gmggCxFZC5C2Ra
 +kcCeMGAF5XKjDb+xkcij13rIk/6WENPfqh2GSSNkWbP556rKmr4uIAyTm6W5qj/zElsDZ9RT
 25o8dhITtq01v5MNB1+dKbc5FMgrR7KpN0jr9b724d5OqnAG64xk0FyhGnEv+h8KtDC7QmQ0L
 HtNCL8KcY/vvD69e+haCF2vEwiPVlPdQ42WM8tCEcbvd0T1Oi4QAlmSBVA0DgkIx3Z7VJjZfc
 hRNvo1batWy+9oI7CZaGOA6sQ5PpbiHi32gS8HUYaMwwasOi2t2gV56svh4pV993iIAtybn2S
 MTy/Z4Vcm/C4/oAu5PCWmnR6ZU5w3vuR+ws/VEULd+UAt5dfAym+pBM8mQFrWmIhc3x29LhXN
 x+HI/f7HZRS3rFR1rqZeE1WA2YnztzWaCcj/OhYBb7RsEWkKEjEAhVTG9vYZeI7sZysNEvPdI
 jEKPaZKe2zHhqkigo1Wx5saUv+bu1fQk7ur3JFjNvo4tNNkbQhP68ifDFCZp/0Fp+1JqVqA0i
 U7ahtJR+NH0xoWdFMzkr4RYHDD9QNhNvpIw0ELsupBhwxXHpQJFQwPLM5FDFWSYn5Nbw+rvG3
 hybvUETx++DWN1jQckghx+ViPdS7bmT78+Ey4IqEc4sn4KnV3F7cLHLntf5rqpJGWNtYz9kY0
 stocc1AOfyymhYXGBKdUepOWCGVcTeT9yUV7dCB6DueCpi9ip511VfcHK8QUxykIznsp1kmRP
 nIt+3yuYpZYtkcGZW8syFhqzjJY9UN95UpMuNP3M4xr045lD/ijSe9BQ==

Tegra20 SoCs supports 3 instances of an I2C target controller. They share
ressouces with the I2C controller instances and are introduced here via an
additional compatible.

Signed-off-by: Marc Dietrich <marvin24@gmx.de>
=2D--
 .../bindings/i2c/nvidia,tegra20-i2c.yaml      | 27 ++++++++++++++++---
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml=
 b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
index 51241c1293e3..2d7ee8e8750d 100644
=2D-- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
@@ -13,11 +13,15 @@ title: NVIDIA Tegra I2C controller driver
 properties:
   compatible:
     oneOf:
-      - description: Tegra20 has 4 generic I2C controller. This can suppo=
rt
-          master and slave mode of I2C communication. The i2c-tegra drive=
r
-          only support master mode of I2C communication. Driver of I2C
-          controller is only compatible with "nvidia,tegra20-i2c".
+      - description: Tegra20 has 3 instances of a generic I2C controller.
+          It supports controller and target mode of I2C communication.
+          The i2c-tegra driver only supports master mode of I2C communica=
tion.
+          Driver of I2C controller is only compatible with "nvidia,tegra2=
0-i2c".
         const: nvidia,tegra20-i2c
+      - description: The i2c-tegra-target driver supports the target mode=
 of
+          the generic Tegra20 I2C controller. Driver of the I2C target
+          controller is only compatible with "nvidia,tegra20-i2c-target".
+        const: nvidia,tegra20-i2c-target
       - description: Tegra20 has specific I2C controller called as DVC I2=
C
           controller. This only support master mode of I2C communication.
           Register interface/offset and interrupts handling are different=
 than
@@ -222,3 +226,18 @@ examples:
         #address-cells =3D <1>;
         #size-cells =3D <0>;
     };
+
+  - |
+    i2c@7000c500 {
+        compatible =3D "nvidia,tegra20-i2c-target";
+        reg =3D <0x7000c500 0x100>;
+        interrupts =3D <0 92 0x04>;
+        clocks =3D <&tegra_car 67>, <&tegra_car 124>;
+        clock-names =3D "div-clk", "fast-clk";
+        clock-frequency =3D <80000>;
+        resets =3D <&tegra_car 67>;
+        reset-names =3D "i2c";
+
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+    };
=2D-=20
2.55.0

