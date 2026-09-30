Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8F014071F3;
	Wed, 30 Sep 2026 07:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790751892; cv=none; b=mOVQC61DRGy0TssN1vr+FXI1vjn93CVB4CPgwOVcgsQJQyGDJQOhAT63baCsF8090h/nZubijdjmBIc9425NUX3OSHXCiwsiWxYbFMC3x06SlKCF3+p+/IQy6I5CjHTZKTU4onzZGDziYzkr6KLgrnOe0R+JSoepLWWq8FMAecU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790751892; c=relaxed/simple;
	bh=NkCPr44TbxTKos38btqNqepNMD4H+RpcJR3Okm9F+0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zngpo0m7QaN3L3QTA+Ke2ao+UIVE1lDsmDkOcMM1HMHiWqXHPDWlRgQBRV36wwO+7GbP+J6k2Oog4ukyZS0O0ioY7v9ciiQBLUNGhwESzzmC7YsyKEISNxWndRzq7kZ1rifj9mwSWOgnb57nkFjnmvmXpcE55VWhcxHOOKTY+BQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=GS5Ywke9; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="GS5Ywke9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1790751872; x=1791356672; i=markus.elfring@web.de;
	bh=3Mgiwf1IvalGo5MR6sHTMIqKBlB86hYM7fULtxacpJs=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=GS5Ywke9bhFFDp5TlhRPeiXAkq8v87lflXBinWFfhun5yMjwZj4U+uUJaBmyqqg7
	 DU95aUpoq2m1wSPaSFEBOIZApn6pwYq6tKPm1JgvOTsU4EqnDnROVlMgU60MimVJE
	 6Ll79LQlwFUoanaXnO8Cid2aR45KbDtMJD8O+P4uheeNLwWv7XMHTFnq/d3doM72L
	 tXZOtvRav96rfkGM9lu94sviXJ+GMdyPE1IQsrYDLC2R6AwbDn9+1LzcV0ZkKyjWb
	 5+FOmoFE+WBExbgB5bpzNFufszpqhB2YHxS1699v1sSRP+wNF8Ah7G9adne4UU+h0
	 AR8jVcMyqEoPHz+i1A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N4vRm-1wkCo81wjU-014YfZ; Wed, 30
 Sep 2026 09:04:32 +0200
Message-ID: <4f327a8d-48aa-42fa-b580-3b01315f65b2@web.de>
Date: Wed, 30 Sep 2026 09:04:15 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dmaengine: tegra186-gpc-dma: Read channel state under
 the lock
To: Ginger Li <ginger.jzllee@gmail.com>, dmaengine@vger.kernel.org,
 linux-tegra@vger.kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Laxman Dewangan <ldewangan@nvidia.com>, Vinod Koul <vkoul@kernel.org>
References: <20260922072233.19592-1-ginger.jzllee@gmail.com>
 <20260929194434.29937-1-ginger.jzllee@gmail.com>
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260929194434.29937-1-ginger.jzllee@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:E1+MpRnAT5TqDR/sERnwPXH1+WgvmtVflv8wn55n7nlkkd3D2lY
 b8VDM8HSdDoAJmg5Vf5tEOLRRev4oOlL7l9pfOz3Jd+RlOear5aPnAuyIi/Uagf7l1C3Wjw
 1PVircBMLyFGulx7rj2NTd97EKMcpJbRArtLdQOz3Vph6DaR6eDKxOWorNmlm+UaRA4i0ph
 mtRvTbZDgsL6GT/K+2rqg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GtCMguPuKMs=;X3m9doab+cCeZpWtP/RWu3Vl7z7
 ovdm2C1m9lnQUVcqlkKVc8YBG0awMTRd7cXZ8ayKMbEH+/CtQGfXfDFm+GAwxoyhh82uE51cW
 6MBFDX+Qd7Y3bmAN0+GvvH9FBXnJFQkwuJBgz1W8HkeyYqlRuW5NJxRLCRlrGvD/VB7wVSQA3
 Ferj2b9qj4QSixY6b+Nt/VA9I53scciqU0ycQ0WblYFYei89/W2EXRA5eLNAXq6ol0PoY/122
 FKrBDAxqOseKB0xzWW4hLjt7Fw3XbzlD9nsJ1RjLVebi/1ugGbbvGrE7Ow5kVyMJ/GqZB4IHg
 iSNXxFUHxq03Ja7cAmYHAd+ZN0q5WKE7FvWpWuYM49OjGabLBMs1YgCzqz9i5WqDwqGfaNUEJ
 sbzvxIKiXPUOANF6WP43JjKOkUR10/J95U46gWFsA1ggd0yXcjcJY3gKCmCTVrTlvokqMvt51
 S6RpJPtj/q27WMztzuzOr3zxXIDHfDFqaBycGs16BkjdPLIKUT1ggXBB3jN1PbtKLheo/D+H4
 VhODXv5KUuFKIEarxYP7tAvtblyh3otP+BzwOylWlVyprp617c6F5Zpelr4A60Jxi5FMR479S
 i72sCPEDzC2tPco8EXg3YKRAaMuRZhdNVSoDJghYLZKRnknEBUC3EA8/FEOHLRwwl0XBK0xi2
 lWiqsrOm6t+xubcnsoFCYg8g5QR72tZyduwN1v8DWdfsstkLgTqRkn2jIHQUIpC/J5iok1Qcf
 Dg7Kvf4S4C0fPxu50P51YXQYFPVewPrbdIADHl4+/T7MA+b1X/RwHvOSenVRN5jvAzCv+F2oV
 jnP6fuMv/i2iOFKZa67bSUuieO59MVXbnQqt9fJw+5w9W2dOKa2SfNGQAnxdq08qbMmcQ6Fgn
 fOn1mUGkYje/iO3t4h3pbSF8nY4QpZrdsubvgY7zjSoADxTFO+zUT8XeiHRwkBl2zpBrteTmJ
 N0zuaCe7a2CkYbgmur3K9hmcc0U7hi4kEMHeC/qDpS8Xil+C+EeaZNtJksvUUPX+yCLznUn8Z
 gRby0V0cCPSh+cNxPGAP7RzHrnVmEi13TvF3h5K7aDnnAGWcacnrF3A/fM1O0VyHacr8oIBkZ
 otleHRx4FyhdHOvKDS59NNPX0/yNJVc0MEC74L8pogbS6dg+rUq209k2IQq1W3gV8WN5Motnd
 bbUEfh9F3PGnDQp8yZgp8kOAifrRfUdl2QGEIJPhH35FEQ0uGExoT/npFKUXj6nYGXTe/v+kK
 jGoCalO+Jp+bVTsJUV6RdQUoANZspZNPXuYBk27KCoL57FLMlMvCK32/HcUDGgB7bvtVoATom
 TE8ZfnSQNmvB5zoTXAzmMhXc82c05pn75KhLyTmD1mAPhz64VXE1BWc0jxo1NyrONZYPS5yyt
 +mAUF7E+8CppTBaar3OIqrO58p2ZBByat248KHZ6Nj00848Ws9KkJqatoWLavz4nigQ/05JmE
 bN86VaZP6Rsv1aBpavbCqRke9MdXwpUqdEAjBPY9/+Kpjoq1kXIBkzwE7QFQe0zmnebVsf4qn
 1PuZrWSkoWhLx18gRohHhjBcvXRlp+oVUWHxrGH9FUGZ8UXtuk+D8Tn3g0LvT28Msa6k9n60u
 Uf+c19mLMVYqT0qDE0hdMFv5wbGkKxIczkNJuiuILiL7ajYbuanMOUDuf/oPrhs+eg4MttVBL
 Z1TcJFmxNpA6wcTuTu6EornXSrdS99pl6IfMiixkAX5IupPar33sJSFKshG6qN0K0W9zJB34B
 BsN5C900HQ4JcPnzSs8GcHJzVI/zE2PPX7QRVPJXJ1WnHAbnLZ0zTvYMHLLM6D3lsi2keXRR5
 aSJaO8RvPrTpwHHDrM0ZS9Xjr7rnqvziV9OEkjztof89Q8BKuK3xQsOjqVOuhwDi1lJlN2jVh
 6ogo+aqywOIdgqVa5J9O3E1kaxKARKoHd3h03IXgZpfI4L9tayfCXRYUl2oTaxgJnuL6VyFxx
 2BI8YmzRR3YblJ3pdqBSwThFBi9H9NqfQryBvr4at7Fpt4yUAw7U7eZf1RqTJkB5GOsjPtHnn
 ocL5b0ArRTsFcidMpUW8WvBoe6IOsCXYPwqEqJf2K/TS+IH7AVT/5f8erYPQzwRAe2WznvXyY
 mF6WzvFPu5ljhzZ/el0u+gAMNjj3oAAtxh9mUOsIuQzr+fGVla3+y8lApp3SrST23hhHmzRGM
 mI/SxU+mRAFttNLujRvg+Y+WZxRvdQYnzB9JC9xbH++VsOrlEfbcFNyDSCIVYrVNsFzyPvshA
 0t0Z4XH0EzdEFoxi8kDKBzxZssGWlRDaZKmtNc9GyBYgi/RxyBA3C8ephFwKCGdXUOarnWokx
 5UmYBvFutyR0tYOBI2FA38KKzIRNM6QlHO63+aHaF9G1P6wdQfeSeaPnpkkMiZCyMxmCMkr7J
 fqeJZ+4IPDKSF+rbtz2GGWF6z/x5hqZmspqadQ25p9T2CRiFB0jD5dUfpyAamklZFr25fWzFQ
 M6beQlm/0Gy2NUK/YBGZ9uKYQo2+Rhlm+WOrlw14ut8IF4kEbWL08Yi094VTe1sjxZ/yRqoMg
 fJt0TsHREKBN9JZF/u76D2WcHlq15CfhIp5n100UtfEU0FXvN3A1KuOyvtra5TSCm3a2BQOGd
 B+Yf3bZVSf0L7blwQpkJ1YozlI3n4Cm21EQxiLVTMHmkI4eH7GKj6qmpBq7gC0utN9eenbBAm
 WZBwZMYGz8/7Y4hfOgaXCMldBwVAAGNoo+KpQjc4Kr+rb4LMG5hPdm5SGjLFUfvo07SqBOSH0
 ZpMSjcptik17l3h4w5E/dPN+qumwAkKCd6bdLqIchg1G32oT2f+Z0h9ovJsgmcGzJrdXOOM66
 edtHhp5gEN1lCc1Lzl3wFMuOzk7nc0zUnXOF+vgoTssmPv7lgMuQj4Uy12uleFPJb+Nfs5qHB
 cIWwEYODqsgvq2fvmfLW3pciRxiwqT8w4C8Uyv4S8fEkwmMRVUHqGzKG5G3pIZa0qAHC7xZh3
 d8RrYHgiPgdQBSPwRfFyJuV7XSzSPGGdOwbSB/y3Xs7FzjgRM9pTYFK745zqovlkTJ5zGXOsm
 2QHKAXtvAozS6nnHIz1rHZbKnbIl8KUyxPmue8FO6vO/ZgI5PVGSk5SaUuawkuIDpr2ZaDXwq
 8heNJgTHe8a37xBLWgYKYAj5JiiRhJxD4xtNzOz7sG+5m9NaDIlmZJyUzE+Qy+PueOjZLK8aA
 mWqCWhf0q+CfjZffvdVB5hbYhp5cbHy8J+lt+Yf/SzhqgLShKClIAWKipJovktRZl+CBigy2e
 mlA14eIM937MJNjGmg1SOpQ1SsMT0M6bjr+fXSDC1QNKyNskciImi4KduO8Tv6yEtwfu55vkB
 2hZOg8p4slRafdE6tyRwyoFkLhkAkmCC15Oq+dP2VfabfweX0riQBjMA7lBBKpOIqbFoMTImV
 05W6CwXZFYbU1ENIUIG7GXxk27xlvXHmyT11dFYf9eBVUgJltO8IwMOOHJLej342GoyP+Xrq/
 Z4B3FUOnkDOBdQMOIS7KjmFaigeorYN2iVPFhY48c4LcSsdIcoboN+fQzmrEK2u1Hwa0599yk
 bAGBuuDnOBb0eqePj/QcB/voTeXCMYRZ0yXplzUxsaPvAbIkl7kqDuY0M4swlxc2vN5JIl2+l
 o3IUevJfkRsurd6ktysQG5miQXQ4a/SLFLe1nqlfkAOhRa5qF8zse6ptZhN+AFhRAfIeYLUyr
 RVHoIJNR1U2wKE21LXKr89KJ+fJpwXtz0tUpygqO1guDxlbqQ4MZAqt+RwG1ySNU1VBMmk8in
 Q+N5BWh1rdv4FY51TgNKIv57RjuPspW4t+EJ4/+a1S8yxrb0diCsA0lvmlJWG/Ls811QtSI0x
 zKPdjqYahKMF4kyHio8QFOfPKmUB2c2QSxIdXGp4XBjFcDZO+Lejg8xXQAPxAy2PTkJ+Dh48G
 o0lLLevgQZSP0OYBGlg2PMI/lcwidciDvUofr64+j3W0Qk69GzoQl3aut2GX9gjVa56K55EjA
 +mCkYUCk3cGvryUUyYOSSQF5XGhjQc5wrI2689/tFHK1pxZZ8PeXDattqfTzidVOrcnIvuaCP
 DQ10VN9Xx94NU/xHSt7NRjnr3jDWRcANGYFZQRkHh6DlQH1fheyX3yzCAN2IbJgBSSkXuxgIt
 ztnp06QDf/0fUfsEj2FsYRyi4kzaWC9K+EvvCey9tdtr94IkHk4n4fk414M9Ck4Z5+NRSMe67
 FjjwxEpG2q03CKKI84W46xFbQWUHOKc2zbHD2rptDjC6VqV+WyEp+w7z1hT0lIuKPohktZ43+
 2CHraKEDQPAPYYCIZe/jZ6zEYq4kJITMkYw/r4jIgjVvVI9Ff3wpOOp3hn/05CURuULhTMbAE
 eYMINuofohipyW51E4xxCEwGbsRsDidr/A6tWNAm1SDgaokvkBGMWA64mTs8LopdGEsvLIYhE
 bhiq+LDi4b3CX8q3rCSrDCLecNqPpbruGIsnJOIQaM2PuRbTZjh0uaaieeAYgS83tZtVrJmDz
 Kudt44tBhiKL3gCLNJA6ys70ds51Pdgzgm1eyP2JPVjAJwcJ3HKWyLnQ5o8j1w4qXVp6dl1ei
 IoQ3IxETJFuZDy/pPKFLKzNr1/MJT5+qp14b5QT7YYRYwF4ApYwSq+MLrUSYCxWEbyB0kLayJ
 biuzjbUZvRNRAGBdBFiKg3rDeseJkry0qQGEhCUimW/GvfbJtyt1AHUbDx3kfKhFqY9VGROfN
 /utbGsoZDTTHy0Q+PyJ/1VKwEOA9or0l05dwVVoJWaptdQECdEhb7veiBypZjNQyll3YJcw7n
 3lfF1GfuN0FjnDuX2TH6m4Z533hHsfuR0RO44B3wRKHn8QBi3aWHdIyTnQGOAc+ddWAhgExSf
 ixjjWOn/etlx5z/e/Q479zdefKDrQUql+pNP9CXPD6dR14/vXgEif6wi/7w/lIztUGoOWIb9F
 IjBVIQ8d7CbtTSkWFvXhr/aQFEctaNCNNZC/FbF6sYkIiOscYGN/MZXKlA/mx29NSVd1gOenb
 eFgU34QyHd/5sSPJI/3EpchF/w+Al/dCrARKBNajWuqzS3r5Pr1cRvkT6Om94iS/+MBEpdh7a
 Q7KMcll7HNq5oCbgxivB+CuDW7JR/CMF6RMIUHsZ+PILSHWd5UAutt5mgXVTbxIM5NHiUPlmc
 jgwtWiyYEbbNE/u3uDO04ItHWhHb+ihAxWU8dnqxH8YGqdMMhGZUu1hubqJ/hICuKryl1+7RJ
 K1r8ViE6ObOxpJCZ0McW4ahmdCsfRS4OhMc8W/5JVKD9b2AVSsYPwVlSImgSy8IiLe224fpFX
 Me8wIRMUUcg0By9+eQsyQUvoAl3mWfrJIjW9AB+MBmanhRVUi/Qga8p0oAoTSW8xkBPe1IZLO
 2dqyZLJ85czHglNhGattbT1qRXPmqHFzrZZ9xvX5MgWNim9ckrENphZBgy7UF8/hmzAan0TYH
 G+xqaXn11LHNPO+mRAy/rNq/y4tqTmnW7BlPsbKvmfpbDTBsbQSnHt9pPwVdecuyTqLZ0Mi3p
 aL5PKe0TPo9bjkbUMFIpjMx49II7PUTD2CA3amkib7a3XU82IGqBd2f42HdOvF8p0/PtZZ81e
 bYmvAuORmAUivVE/fj1rD1ljnihRYGu7p53CqBYWaO9r3kGhYCv6ZY+A0R4JWbqAocYO9AkKb
 fhJlCENyndt/iMnxm0t8MRf/TZ+jRyIM+JS7DVihPjgmPqQ8Vye8m/w0q7xXgC91daqT2mJY5
 Z8iOAAicSuq9LY6VPNtTGMD9kgqUQWxOl07qHheoTnVWxuUJlzsWsNgn7wcLuA1UB/sEaRheu
 q/rmRQe84mOr4sKdODdYy132r8rdREGZ40dEr/RHMrH2m8NaJyHBWq6xeRSSgiqJ/pnf9zmdf
 8AtW9dYVVvRrV35U37UJymyCBhqW+Z7QeeaogKif6XWYkvUam+zn53SB14GeXEdPVCHfMoes/
 yoZgI47xVllwh5OOPWs2BN8R1MOFoWJywcDgzhTczA5Q9BFE3A+PwdejrWyD9FWiFFlDFA/yd
 cl61p+kW0nUpwGTNPITDjkz+gSTkQ0IW24aAVXijceLh0I81pMJNz/peY5pgLge6kw76nE+4H
 eMAdJDPMtkg1HzZJRyMaVu0l71hER551iWkT/IZFAy5UYnoPWoY34nThYUYW3Afu+MZE1z6RB
 gLYq7AWlATKWnVk5gz3nw0bEhYy7eoiMCBCbWKGpuo3ycsYrk9CTBejZYwH/RP8l8c1ws3bDo
 yQ9O/lAiRg4aiG7W6eWkh/Idz3yTcYhUwO0Q5PlFV0QO0wdtOxvg68aUmaavH3IQCd11/34RI
 JCbd3JtzaJ0+7Y3ffgueQU

=E2=80=A6
> Read both fields while holding tdc->vc.lock.
=E2=80=A6
> ---
>  drivers/dma/tegra186-gpc-dma.c | 5 +++--=E2=80=A6

Was such a data processing concern detected with the help of any
source code analysis tools?

Regards,
Markus
