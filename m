Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794775736;
	b=TWZQr8Q74jxtwRbR4mRxaq9TQZ+j/nbJxWjRfHSQdrTWIJClRkz7DIEJRVsB87scEgVr
	 rqttvtUgdImipkRgJ70qHLniNyBMIg56POVCGAkxRujiEY49/Gas2xhA4dhVCBDjeFFm/
	 kHtVO6eN19gPJsaEb0RT2zmGq5k45fLEtqnVNuSLDiBaRBQacwxLOyZSzEmktbiat81yo
	 S0mT/ZF6K3q7dvGsVnv65GyNKKLvnqa3NAgj1pLnrE8uU2LQm0svMeTaCGwDneCfthwdA
	 tNqPLuaaX9ixUwpBEpBSlZ9LQMsp14roKUmT4QJa50NkLl6P89AeVZ7NOHcPQMjbP3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794775736;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:Date:From:To:cc:Subject:In-Reply-To:
	 Message-ID:References:MIME-Version:Content-Type:X-Provags-ID:
	 X-Spam-Flag:UI-OutboundReport:Content-Transfer-Encoding;
	bh=kM2kpEA3QU8lMqDTonr8uO30HPQCQVnVUtKUbPAA8xs=;
	b=jMmlDRs3WrtxfFpFhiqvKjltY5Rnk2nXJt2fThZlDhmcwEc8Ze71VFlTIlGJqamFGEaS
	 qsZEMIF40zkTrnal9AeZamiUq7IT03GIGZAtaO3CZri5hLyCNagwkQz3tqvO1+KgW3oQ+
	 iKvIxE6+V/OKIEpJuKRY9kyVulYWzeybqjWfjUM/TBPx8xH4/XaJ6qR4lcZ1d4OK4/fGZ
	 MVZdLQ3tT1fcHh67Gp/SWlFcYQLNSBg87FTCTc8Yz454JOgbusdQ57VneQWQsymVLXK4y
	 zYF4rHEXBKfDyjrfueiDuuWalUzhPKxzIcDDeHFVbbBNHmAfzgS0XlYTkLOVjf4e5dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.de;
	spf=pass smtp.mailfrom=gmx.de;
	dkim=pass header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b="r02AUu/b";
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71CC606A32C
	for <linux-tegra@vger.kernel.org>; Sun, 15 Nov 2026 20:48:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E71CC606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=marvin24@gmx.de header.a=rsa-sha256 header.s=s31663417 header.b=r02AUu/b
DKIM2-Signature:  i=1; m=1; t=1794775734;
 mf=PG1hcnZpbjI0QGdteC5kZT4=;
 rt=PGxpbnV4LXRlZ3JhQHZnZXIua2VybmVsLm9yZz4=;
 d=gmx.de;
 s=s31663417:rsa-sha256:XaRleM6StISnPglk91adNYju9MIX
   4osKW/1GVG3LP1/6WADwl4VcEW70tyrhOnbZfqcLaf09INbnLqPs3JISTXjNOqRrTIhW7t86K8B
   f8RgbqM5Pp7vv8S35F5dKhuz8olyMwtAex55hTxvFcyG/E6cM/G9iqqpOUeGETqLs94327iE00/
   G7F//PwenHugoeAw1GKawYisQyeoRrKRfWk/b0DpZv4a0K9IOcHuX9xRA3Jc0rqZ1R4D00t2ic1
   z4wjT2avUgStVDTkSKn4e3pjfEFHmtbsD0704BA1Oc4qiRWqoBd72NyLHMATI30ElQgt6sgafId
   jCFNjHkBC1b2NQ==;
Message-Instance:  m=1;
 h=sha256:
   jmUsr2uyz3L/KDMZpnXzzObmb2Gk+zMHR6hh9YdLX6I=:
   vz/Dij3TLqDFdDnGtvK0VnAhoEXm4LdMK49AI7K1gzg=,
  sha512:
   P10rqI6glE7Su+EktqeCyX7koljg15ez20Lbn6o0+jEM9O4lUSKA8JRGDM4othVk6ODNSnQJDAQj/6vZiOVAwA==:
   c9ggIRudoiuFCHFlGC5WkCnTEHgdkwTJZyRFPol4a2TZ8lxki1tu6+qgbod0U5kK3lUXkm2V1DY60qa+JnIzEg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1794775707; x=1795380507; i=marvin24@gmx.de;
	bh=kM2kpEA3QU8lMqDTonr8uO30HPQCQVnVUtKUbPAA8xs=;
	h=X-UI-Sender-Class:Date:From:To:cc:Subject:In-Reply-To:Message-ID:
	 References:MIME-Version:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=r02AUu/bpF6vKbSz+IuspGWuAfbCTr0OZdE0hbIFV7QLw+2YwrqDyeHCikrgE1bL
	 MQZWs0owCSkfCFCsqMjtexK03brJe0HbxPPiW8OHkjsJgiRFqwD5FxnZiualffhQr
	 UbvEwfL1Dks2kTdA/o9lJQj4aDPN7t2Rvy7CoGfhsBc/k0P1+NU4C8om71EZWZLiL
	 ueG2SRMJ1ArLXiEuvXBQueqFCA0fdwaqtwsOuJaFfs7YQD3l34ELEKqjQtPP5Y7NJ
	 RK6fPLcHbk4zmdfwidCCMcmC/Z7+VkpBJOOvBgOI27MuwjzXZ1vcRXXxTadGPdz9j
	 DUB4jQ2UmyxHyeof5A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mn2aN-1wlhIi0FpH-00gaen; Sun, 15
 Nov 2026 21:48:27 +0100
Date: Sun, 15 Nov 2026 21:48:25 +0100 (CET)
From: Marc Dietrich <marvin24@gmx.de>
To: linux-tegra@vger.kernel.org
cc: devicetree@vger.kernel.org, linux-i2c@vger.kernel.org, 
    Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
    Thierry Reding <thierry.reding@kernel.org>, 
    Jonathan Hunter <jonathanh@nvidia.com>, 
    =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: i2c: Add Tegra20 I2C target
 controller
In-Reply-To: <20261115182616.354580-1-marvin24@gmx.de>
Message-ID: <aa962cbe-3b1a-c0c2-6aa3-dbc18184494d@gmx.de>
References: <20261115182616.354580-1-marvin24@gmx.de>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Provags-ID: V03:K1:FKIobQW4T926FqSmsTZRaRWTAi2ifcShaA7ujUHChLDtSLRAO9A
 M8y4wn6DAmwoshv6RMS0/HRxS/gTn8KQk1b/HwNZBFFFqb7KpTbfi1KTCgI97NuPQVdXLpH
 uNXYK/AHUaPyN2WI80+jir0P+wPfzUEBuasCBCfdIfxyso/gbWEUO0O8gvWEvll2hdp/eTe
 t5/jH/uwWNRrv7YQjAnfQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:BBkNYLql+As=;GoW8Mh6EcAz/+F0SYjvrtIL1a6E
 LukcrV/ZW9MgTePh9tOng0OxP5Oqo0YhYede+Bw5N9L/GT2fdpVcKRICRlQvlI+yg3uaRYi/S
 zKONbw03gpaCLP1+CaoYPUkK1xEpJ7Qyd5TjF5nSIg6gq1++kt8pbXtSTScZ/zsGWlrL7/EZw
 G0JIis7OXhg1kJZJ5yWObxlbzNdf4KlrZ61ge5Kr7png7P3OjLHG5w4nSsA+J/VIjptbEClON
 BYAs+DvlPaLdIHYJNuzZUWKXhNgLBnhLvXX+DUqHu3s+3C8oOPceVgvXKIXmPX+OVF6O9Syli
 uwUaj8o5ZC4Vx0KfvrVztrmOeqtWDDSoFLSJRSbDt02Cfy+h8Nyz4SFKFMgw1ljBimKRgkEQo
 SXTBJLOss1CDSnVunkmY7SLBMLaH0ZgDlKdOOkFtpzxqTHvyULbKPxqupEnNEz4AWViH0gIhy
 DhVgCGp4FkCbFxO0iXX3Ru8K56UVwC/pFH5JupaoKUxdu72dxwcuDXLflI/TDFkq9x3OtRovg
 uCKh5ENZX0qHiDJDDXHFkULHyqBS9rajQnK5dzzJsccV0Glz4Pa+9Nacp6Htt2SUrGTYiI2b7
 pt8pUeALgSkSov/vUySFRnvEyDqd3ppHF7qtp4cmB0m4El0Cj0cttUYZdBRj95aeWKE8WmhQA
 ffGBbkPqDJyQBTxq4L34J5Q8af5upRXHWyA+I9rt+yRQmRXRE4/LYDIMg+8lzyaMT9iEk/CdO
 nlnkVr3MObUyIhPuyCaaruMcsUlszjCSWDm6Ipi2Fw+WNGFx6Z40qT8I4Ssq27L+yzmNnO07g
 CLrUd0gfXBsPy/L4jD2a8VA2KQe0yzcDFDce3oxCBqSo+FwH3O+KsaKLz13IZIJWwKUU4JqPn
 HgXFY7BR5omKOPMEQCNjd7qw5UdAZ3Izaw54c1rxHH577YzARZMrQQ2TwPVVCiwcB/thZhJZo
 09vvq7U2qnIO9R1LJSpcOne2H1JcBVRw+PJYgDvXxlr2NQwdeb1jXygab9re+7JWJ9whWlGvt
 pu7Y39R/FtaHzdLGIo+aFHGC51gshyFCk2tj6gj3XM8DPifIrR735gWW+F5k4GImyZSTcGK/M
 tDD0mLfhnMhEJCdfMioPzLZwZWlsxt8x3RVG0jPqIqBxphf2UpwSp30bQneZVySzlUQCsGuQw
 5vlQtKqlLxB/DEwuzfzXnEe9dYiixRwgdtDFpA2TkiL3wNFK6onxv4COBml1Y24QTFteZiFFR
 Duakka+9/Scv05p6Hnp+J1ke+eOxxbwtFTtasjX0p4VeIH6AtBunsvsw1mVIpd+dnjWRxl0E0
 mUBxw8OLvlMGrHGtmjScTCasne7niwNC+xtvpWpBlPcrwJxcXhLspCUj6ve2GSoEN1O75KGpI
 xa4+h1uhwdwkl7iaxkzD4eptisx8geFM9gXXfvAb46m5XafcHOpN9N+oWkfNiRmqd/C3Nibtu
 wtPSTz1bij63KgCpvTzbGc+LhQ/j9ELmkfDBx+l0bsM45KFx7TXWD6Nqxr2fa2SbOHeed9GqW
 jRaGTvhhDdkqFe3a37bNTK207U7s1dFtvlS742mV4In3SNIzCo3tV0nvtnLVR8WPUHOq4YvH3
 tN+0Evt7ClUrpFbw766IYuBQeNq3KVqtUeUcn24CHcYppGWcF+71HUKW6XnlaZG40PDOqEa/Q
 xYoOxr0Eh6Zrn1hzd/i1D2S3aLW6/bw+kq30i1bWjdhCdYcsT3XT9qknh5/MFXMxK46p2Y29Y
 dMN5zVwN8ofL9m1anNB0JLVMAFHbqEzGiB29dEeKC42Qan5XBIXB2NsQun5hEZseHJI3w0rZz
 +UImDY3Tds6CIcf/XNMBsgputmb+ZemkDRV/FQJPe+ROrCqy30HT9sYy78EOyeBxdyjHOU7p1
 /Jz+Lg62NBoThXQHLyL0vVIdAgh+DfVYLKpqFuIKNK/tnuZGQGndYDQ6UzL6Nziss6I5lvmyz
 MEzZFqMJLinsagtwSmWyvMBHDdew4dly4ZmmWz+fG0DJRsp4Brt2k7PYw45q/iVsihaf1Frdj
 D1H5XddlAvzqlXL8aRFiSSSIkJ/gSgwg+W8HJroKX3Q9+z9YHMtzu/ALBncDqJpRSSk4Uxtds
 7CP03k1OH/2wR8vEahHY/DbYYrtj6ndltUTaqjNOEqOsXMrdiac6SfjPwPmCbZj61bA/2myJh
 v8Tf3DKetQswjorh9Fz0awPS0q1CeF5JP2nfTsNIHOvvVHFUFLprYNIUyEnxobC30S+DAEL31
 DZ+4Kgy2hHnBPLdGuULxHb6VkN+FNwyF89HQIyt92OHs+g2UPjR1rEGS0bfcXU8S940pRA+Xc
 Vl1yj9/sKhMV32x9A9yH+Uwgu3Z2wNSvrEMHcuJ60HlcjRm6akMRwtGtqugWSO9IdvQTDMjI4
 +e2vSImo0ThKhV/a7GGcfsnRag5pIq9ZS1ZgrdkSOy+Re6hg/hvdXjImVOWd+nv02ePi8H1eY
 H2L1zkjVN/I7XIb3BHQHSaAH+0URcYYk2g1U4RMEVJDCUsWVJaaCM6eUo/m++hEbw8bcvWtWB
 +Ibrf989bAp3XAFPJmvppoIrmxAccYbnm06LMvho/vhJzoZMwc8wCuHAgor/J/O21c+QV1kBr
 gv01u4YNKgR5OWmweZcS0g8hZI6Jh9C5jBMo6eIOVYSmxH3z7OpAYAGhN05P4BEUV8q79TSKC
 NQFRvFg0rjZeZuHH5TzIvsjgjCa2v6t3rSwISALEuQdka46ILla0G4lTYUFjOaJ+fqfl2MJ7J
 xHShOlYVxWVIQ3QH83Fexzk6dJPVR4Dmj4KoQUJij+quuB5RzD3ouWshiTa4j6Tg4wC515UjD
 +Wq0OKdg2FzWuzwRKheipxGetGKVqsBzGY44vbBdihzZzrJZl/A4+VYE9TXGbCK2Zo9Mu3kC2
 BEKvSsDNwt7mwCWqsKdqxYJ1VgvsHIcVB/ppz33Oue9AEu3fq/PN7eAg1uXx7U4tPqjlUsxu4
 jLZnIGl511E65z8/TL7I5xxQSWfu1FsrWD+rdWAH5shnbglt7lJ/Gzfan2hVgTwDlHLLHw+nz
 bAUSZq/1IchCEWh4s2bhJDwXtzeTy7Qq0QbU/LXfmHlgWDsbeYHCYFUNaTTErAeZF7TwWgQVV
 sDvaQxxSDRSAgF5787K+GQadbrwtv1VuhAuX7MBsN8/I2MbWbRHnczp0fsalsVa8x6vEUc4TK
 O74vmzBQvJfQCF1bsTtmqfdvj13emUsp/dB5Sa1hc7zOaxcx908bZlK016EDyUeK6GHC2y9c7
 ICp2GGyk+LwGjzyksz9TH/itzS7teqPTaPuL4iiX0XqaNqcdSRmp5GBKWeZg+JcasX+7qW/Li
 KLE2LKEa6E2tB+iQLq+WFQSXXVE0meLTyNy8LuxdW3MzTifqNhOeQR2RvmxaqUoiu/oE+fncA
 wmz/f+mhTfnt5/itKRCCpKjaKIHvYWIMVcjCfeJxHXW6xtk0CMj97V42CaTAiXDfkqpEgqzEz
 3amjoxdXEEUw6fJFoC1boa0AO1DRkMoMlw3h4ghyxWv9KF/yzx9LhtrhYgD2bcO2ENq5b8IQl
 0IFqy4JrRszdP66gLfckJnn2so1y2d9ChDhWQ6V2i49FpnZVd/UW26phgz4GXClIXb6ZQKa6a
 zqlfMguTfoEWgr/F2JCFh+k6fF1l+bROhhSi0UqHh12VbPJ4FH+PTiEomQw7AftKZurWnNN4J
 /i3u6TnpKXxd9vbPMWQWR7V375O7xXJ/JWO5zlfQKcoADZU4VW7oTO8PzAl76Zc2DEpKRUpUP
 2F53cF+sMEF0UrxrC2IyvV474acn7ZeXOspayF7/mkIGQjX/H+YUJr74o++PmGgIIBT87J+DZ
 XLMugenLAQHP8hVs3k7ZrdUAECaaCwmcUX6E1zsmEPGJdFUXnZ45IXDR6HVH14rhlPHbvfjEU
 AAFtz56rho8g3Z3U3+60kxRp5HSda4YzI3nYWomWjP0LeLEJnh8b8lsbbqNd+ZA/Lz72IeAaW
 6sGeVBLE3MmzUsbAUQjy//F9vHjWxkxG2YKT1Ac2AK5/Cbi/lDEdVvfVPMxuNhAF+Z6UAWyHY
 h6WnVPplwUyH+zxP9XmA62eOV5wDRe+CaUBVRopOl1a3VtWERJFNol6xqZMe5OickBQbsqBNE
 M0Q6k5eP1QMREGKQ3QBslpQD4RU7jutTEauopazNMBUips3Tb2vIbSqzdGtjjrM6z9Px/FMv1
 mseToB0WegwZvF/uJvcaM4ocgMovUJcfdCSvuanD89cbxNBiXwr0W2LUEGjZESbEizfns+2GR
 RlxO3jzNimMCiruOyxn+tWK/twwCcMMmXgufaKYF/9Y5aByiZEbvtQFWVqUixBSOZGz6TsvOX
 vacH8bI5LMmETJzNHxfobTzi0GwjAtbJh6kkdp/YDmpTL8VKPvCoV/AHF/vPayaqpaZ8XVWw8
 i2BULGOuDZ3tbgp+mwVNVmj/eL01apUXJh+UAId+p0HKbkq6hqqxifK2wwGbI52rbv1ku5BBQ
 y2stuxiKdSwhyuujp4toP1hsGWBxO1UjgG3glnm+6Qhn0plyFY42tiZ/3CzxKl207J29KKk5q
 vgAn/TA2f3B741BJ44lt8Z2rp/EF+25flqqe/m2uzpEHUwlxyKr1173UX3Bniq7z8JhTuMm34
 Y9/pBg70kfi+LiUweuCv7E+IObbfWiw9lJNAS+RMseqJfGXoqIXzfiidh8F69W5uJj9EjBgWE
 LWIhEH7O6be1oamzUYSvpMJYW67cO/oRG8UMoIOaF4lEmEFUwcXanZTQjyB0vkISl2+daJdts
 1b0qFYvRsFE6BT7EbwtF4WhDlHYKyL+KcB5Cd8o23XqS4d98jYfOymSZt6pSyk9Ue4/eOx+MJ
 n1MJT1YvtqhdxmjcKQ8RdmxCKBlR11d0g+3pHmfedmqZRjluV2TqOOlwphJkBxATsDC/3al/a
 NMeQRM+sLcW8PjC5nrOWP9KN3i7fX+Unv7pMInuXN1n2WWG7yajfAe0ePpXpdg7986GHDzLDv
 RTuA+JK6LQTowWRVG3yxCx3PhR/WzwMGamI/DZ65UGw7Z8illzhsjQvv8ai35SR7bEzt9y8ex
 AkkjUQE8dh9Bm+v8jTQNVOJdfbsOmE/arRxTz+bgs3n4JxKOl2AF1+KrNrtzt7ape/d5MKw2R
 PF+cAgk+SXCfVbra8dIJkvRRccFnqms2Nezclw1bpIEHo2Rn2D5b0bY2asZoYvOpPrEiKOrsH
 TLxj5nCSg6Lf7GW1NXmOY06gl5kfT/iUQSBPY5BglmomiEfir8gcdzUtnT7kUkTGls1pXfFQH
 RcN8PXLsWMkgJT2PuF8j2nnqtbcFCVCy0wFDM0CYtJJMdPni8YjLFU6wK7T8OBHclzM+nWg9R
 UmCBlnb+7ZT5fzeCH9R0wcZIOqODe0ICLT/QgYC8uG+bR8UkAVVTLugYCFvumPV0pmWcm9Bqc
 IdWPSyO/Au5SbL82jJOcgEf/RK4mefFyRbMer9ar1XuyBpvV7IpiMmg0OEyDNw8Z9keBgSvbN
 BUvF+iqAu15a1FqDlVVnBnwWSvdPMC6vWl1AigGJgA2vt8eDpCFfszRKwtiycmhj4y68VKaDB
 tGDWZywijRDBkXgV/wVFoJAnvi0QL/Sda14WemAH6dd7mUFfYLycSDvi44BtCFfxAaDMHeCrG
 SDBk4e+zjHebtAmD/irfzuTWOk06CaJ8MzQrE3Si1v1ciuNTM7DB/qPncbAXBZQuTpvAt97vO
 dhBiEjZHZrzhNdWGCASuoeauxTP9Dwhb3QaKgsI3Kg0FFFx1ckwg8b4j/tVL+WlJHNrPyTDcT
 PIKG3n+Q+VRSPx1m56VF9JqtSXEZTVNnVp5/f55wZJ6ZtqIOAdm4uYY0rXWPe4r5HJ0W1iGs7
 sy8piZyZrYDfezWmt/fnTJF6pti1X8bYyQnfP52YVOUf9Q7jRZCtvWMX68aio/Qcc69PTPcJ/
 CbbFW/Wh+YqmDTMn35Rl8fTtLmgWLrWLye7N5zD9Y56BjvIN5UoiXbJNJfDrUjzJUoKfNs5NL
 6X6S6ggUWxC1fpTtmbNAF99ixEAQRO7fFfQEu0tP5soAw0H4i+FmqHwxUtVMmZdyZRGdDz2gk
 C1Ji1/8iDcdBLdONzlS1MSKEc4/YdUDXTJkEzifYgZTj1mEpoTT0hurNuZegq2dQm6oSCtBy4
 fqUicgl5P0gsXMqIOn+hfe5ggW+QGw+op9sysFdxKm1pFqTPHDWeHBhsghhtnK8UyUSu4hcWy
 j7ouWRn86IYtHEO8xXWRrrkDeTGUpG0zYcqNJvVVJSxXanJZ3tZdI3phxaLAk/eHPaH5v1G0J
 M1hxO3e3qMxo8c4eysoRXmxY79TLNV/YqZMWMCYxPyT1Mt5w5jUyYACt+lD9tCWWLo4clrBfu
 r+xZ7pmfnt7vpcqEo1OE6kcOZBPurI21zWCIS2kJJWsROJNd512NCe2l3msASOhOqNlgJenV8
 gLIVmDBoA6nkFJZeAfCAGeyRP+irhksqYYrG/C4/KryF4AwghTVzCBFOVeuCxaa+i25mZgjaJ
 4UcweX3UkTIH/MepNkKqxLV/uzqo9NiNURVLmnNYTO4JLgIc4t5M59qbq+9vMMZGuMoLqqLry
 lZE7xST7iU+dZlx7tBJXmYoqZVjNC+Iy3WQv29XtPMz84dCbHBGsSPdSYit9hJ+6IHlN9W7OV
 xdZpC8Q3UDbHI68Qt/QEtTowIUiVuTIKYnoRKseL7haFvVv5qQfHvgaFA4de2cstXL2Nbd8gf
 PtLtc8wo9NVcyOOXlQI2nRg2ZuBwtc06cSRayzGlC0+JkoNlw6s6ymFw90wQF30yU9MS7SU2B
 u9bwGjrsi2vR1IH0dAWreXz0iAHCJdtgnRuPei7lXga0Y/6pNBC0D/UAOATwcnP7LehnFaXdv
 BzySw9OrDh+aY5graA8MInk92psk2Uln+53u55NSHSb/pVEYQuZTOheafY7k1bhqLzLZdp86R
 TgyqJn3jMaZYsDVG5kBBAZLRn0FgS2Yyg7pHjPJwsquOQ3pcixlehkVq9yLlWO8dUpkTq
Content-Transfer-Encoding: quoted-printable

Sorry, please ignore this patch. I accidentally sent the initial series=20
again.

Marc

On Sun, 15 Nov 2026, Marc Dietrich wrote:

> Tegra20 SoCs supports 3 instances of an I2C target controller. They shar=
e
> ressouces with the I2C controller instances and are introduced here via =
an
> additional compatible.
>
> Signed-off-by: Marc Dietrich <marvin24@gmx.de>
> ---
> .../bindings/i2c/nvidia,tegra20-i2c.yaml      | 27 ++++++++++++++++---
> 1 file changed, 23 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.ya=
ml b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> index 51241c1293e3..2d7ee8e8750d 100644
> --- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> @@ -13,11 +13,15 @@ title: NVIDIA Tegra I2C controller driver
> properties:
>   compatible:
>     oneOf:
> -      - description: Tegra20 has 4 generic I2C controller. This can sup=
port
> -          master and slave mode of I2C communication. The i2c-tegra dri=
ver
> -          only support master mode of I2C communication. Driver of I2C
> -          controller is only compatible with "nvidia,tegra20-i2c".
> +      - description: Tegra20 has 3 instances of a generic I2C controlle=
r.
> +          It supports controller and target mode of I2C communication.
> +          The i2c-tegra driver only supports master mode of I2C communi=
cation.
> +          Driver of I2C controller is only compatible with "nvidia,tegr=
a20-i2c".
>         const: nvidia,tegra20-i2c
> +      - description: The i2c-tegra-target driver supports the target mo=
de of
> +          the generic Tegra20 I2C controller. Driver of the I2C target
> +          controller is only compatible with "nvidia,tegra20-i2c-target=
".
> +        const: nvidia,tegra20-i2c-target
>       - description: Tegra20 has specific I2C controller called as DVC I=
2C
>           controller. This only support master mode of I2C communication=
.
>           Register interface/offset and interrupts handling are differen=
t than
> @@ -222,3 +226,18 @@ examples:
>         #address-cells =3D <1>;
>         #size-cells =3D <0>;
>     };
> +
> +  - |
> +    i2c@7000c500 {
> +        compatible =3D "nvidia,tegra20-i2c-target";
> +        reg =3D <0x7000c500 0x100>;
> +        interrupts =3D <0 92 0x04>;
> +        clocks =3D <&tegra_car 67>, <&tegra_car 124>;
> +        clock-names =3D "div-clk", "fast-clk";
> +        clock-frequency =3D <80000>;
> +        resets =3D <&tegra_car 67>;
> +        reset-names =3D "i2c";
> +
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +    };
> --=20
> 2.55.0
>
>
>
