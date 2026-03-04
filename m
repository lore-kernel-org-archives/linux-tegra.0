Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF7436A00F
	for <linux-tegra@vger.kernel.org>; Wed,  4 Mar 2026 10:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772621708; cv=none; b=K0N5gYYW2fltsiUMfhrVTD7udB6CqSaXjQniQTqx+2mIGXZuzbpb15UybmaSL4+G0DSya8AaK+d5hK4ZOMLb3KaL0hBjt4q6+/KWOstmbUTrkeQCZxjN3xxH0E1agery1OoM4Vim2xTAC94k72Q18rH4rXmPHKJLR289u7MLP+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772621708; c=relaxed/simple;
	bh=MmTnLuLplOsXyML0354LlzKzNFPbQOqqxUQqm4VEpRQ=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=jmPP9GQ6nAZ+WClBrWBkwQyfJhEApeJbcr67PZpQKrxS0lgLf+qDss01IZ/Z/HLM5PygH9wIyaspjLNmV2vAajVfH44vPp2py9BcX8Oy8OVM+BHS7vLHOtp+Tf+5S7vkwpMf78lRrzoA/s/ERc79/x+nXEYcZI7Z458JrMT+M4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NWOxtpx+; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NWOxtpx+"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b9373af81cdso58438866b.2
        for <linux-tegra@vger.kernel.org>; Wed, 04 Mar 2026 02:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772621706; x=1773226506; darn=vger.kernel.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=MmTnLuLplOsXyML0354LlzKzNFPbQOqqxUQqm4VEpRQ=;
        b=NWOxtpx+HJkLFCWAU5JIPzqqzJBhlMbRgiLPQEUsZgF7BPJsRaYcqa0rH3LzcrPkXB
         6GgvZ6Cw9FPfTftDP6XOlHQeJB9BKuyiGbLRbYaMDsQUTE4hJEHccYMRhsEr/EN+Gw93
         cRt+139FYpLZUw+GnJeXxyIOS2BV4XokTPwEQmVLuPRF8ibdyU2Vo/iDdsVK1QdZE8mB
         aPRvjZx6zzzmSKAJG9ZUTnj60BFFzpDZtzV2WzShy4Bf+GdXClNbDTLa1uWQF943Olbg
         Z26Vuv/IaTQPu/1aAswYzvy70D/J7pwSt3RhfwSek8Qgudx7b7krQIVVqeVW6FVd2i/s
         b4kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772621706; x=1773226506;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MmTnLuLplOsXyML0354LlzKzNFPbQOqqxUQqm4VEpRQ=;
        b=fYTGxT5r+QXatDGCv7/K3mwU1R4CJaxu3q+kWdMIBaCfUU1WSwtMKzArPxiSjGHZbu
         J7yD1KT4bWJ6r9SwFKNTUuSXYpwyRzS/9ApI5tcVcdCpHIVS6/ZRGMPYts6xxZDgrLuq
         1Nfk0RNol6J4lQU9vtVwxLgkzPt2gUori/59UbIANgubYCA959jQQq0qqHdsdOgUofVU
         TVXOMj7xdz0ULaVRnUp3foQfwx+Bfrwp5CYJMeiuBEKW1Z0HVue6soVYxUE6dcP1MbD4
         5W2+ESxZ9Bbzk5h3Ozhuo2wTtxh8CodUvaeCbuLvDpWO/WBg7YpJc9M0aky3ry6bIkBu
         6rpg==
X-Forwarded-Encrypted: i=1; AJvYcCUVizxVF1wYsp4dp7WtDgksmsskvmgtTiYAvkmVw4sb4nSuzzgRd8UQ6ER+oa+yL60FhKkxM1aDxs71bA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXvw2nq1FSGeNLlI0PpbDcEKDzEL6k5g7GN/bPkFV6EGILFrYh
	NXCeyQuhZHwP+EkrKGAQ+HoRRjukRcdDaNpersj40K4h9A+LBNzxvdRS
X-Gm-Gg: ATEYQzwcZmAFDdR5ulIJ2SvEu4MlW2uZ/6LcJ9SGCDxLvTN5Fcjbpvuy/TBC0wfEUXR
	MfrMzfP2Sf68C42QRYeEWPDhO8cDsh8BDRccKe7a/XoTOqBp1FErgVEYltdgUwsr/dqcljmsuL8
	ZRPYZk6Uz9VCdqDu7RMJPb3ETBaScsUjANRT2TO8FHOoBYjEGuMAI0WCPvLVVTFOPM6V6dCFMOd
	N1OJNtAl8M7kz7h+WSEYkEOrxSTogXmdokXfSXsUpiTsF0n/syCXglLvup9lzt2gOhE+l2Mf4ZY
	0YMq/Ufzr1j4YZpUiVmnMjxKwTZR4ZhwimrRRAjy/tUfDD/gKvulyQJu8ufyULgnZcbETOmgzT+
	KgHAmOR063sx3yNihXs3jnFj7B30DcUBeddARXY8FlkTcn+Ppzx2hbmwBnav3jC04h0AO+teYKN
	L5B2yRLjW4bge8TPseNi2C3k8cr99kf0z7rpr9aYrv96xPlbJykJj5ASkyYDC3OiFTO+qeaOjNn
	2oWFNrLqZ6vM6CdYQ9j0iGEj5DeAPAv6JGtbi8EHIkfK27d4GgVAYl1YLciPy+AGo85PVNh
X-Received: by 2002:a17:907:94c2:b0:b87:2471:def3 with SMTP id a640c23a62f3a-b93f1584b7bmr104102966b.55.1772621705369;
        Wed, 04 Mar 2026 02:55:05 -0800 (PST)
Received: from [88.202.160.248] ([88.202.160.248])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ae666d6sm720698266b.37.2026.03.04.02.55.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 02:55:04 -0800 (PST)
Content-Type: multipart/mixed; boundary="------------XnJugc9jmN0okhNKc0vaSIQa"
Message-ID: <4e5c94d5-882b-451a-9619-fe4b4783f1a3@gmail.com>
Date: Wed, 4 Mar 2026 11:55:04 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: marvin24@gmx.de
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
From: Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH] staging: nvec: fix block comment style in nvec.c

This is a multi-part message in MIME format.
--------------XnJugc9jmN0okhNKc0vaSIQa
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Fix block comment style in nvec.c to comply with kernel
coding style guidelines.

Signed-off-by: Alexandru Hossu <hossu.alexandru@gmail.com>
--------------XnJugc9jmN0okhNKc0vaSIQa
Content-Type: text/plain; charset=UTF-8;
 name="0001-staging-nvec-fix-block-comment-style-in-nvec.c.patch"
Content-Disposition: attachment;
 filename*0="0001-staging-nvec-fix-block-comment-style-in-nvec.c.patch"
Content-Transfer-Encoding: base64

RnJvbSAyYmZmYzI2ODBlZWFiOGQwZjRhMDdjMTc0OWE2MGJjMWMwMzQ0ODNlIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBBbGV4YW5kcnUgSG9zc3UgPGhvc3N1LmFsZXhhbmRy
dUBnbWFpbC5jb20+CkRhdGU6IFdlZCwgNCBNYXIgMjAyNiAxMToyMDo0NyArMDEwMApTdWJq
ZWN0OiBbUEFUQ0hdIHN0YWdpbmc6IG52ZWM6IGZpeCBibG9jayBjb21tZW50IHN0eWxlIGlu
IG52ZWMuYwoKU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IEhvc3N1IDxob3NzdS5hbGV4YW5k
cnVAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvc3RhZ2luZy9udmVjL252ZWMuYyB8IDMgKyst
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL252ZWMvbnZlYy5jIGIvZHJpdmVycy9zdGFnaW5n
L252ZWMvbnZlYy5jCmluZGV4IGU5YWY2NmEwOC4uMGU2NTVmNzllIDEwMDY0NAotLS0gYS9k
cml2ZXJzL3N0YWdpbmcvbnZlYy9udmVjLmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL252ZWMv
bnZlYy5jCkBAIC02NjAsNyArNjYwLDggQEAgc3RhdGljIGlycXJldHVybl90IG52ZWNfaW50
ZXJydXB0KGludCBpcnEsIHZvaWQgKmRldikKIAkJCXRvX3NlbmQgPSBudmVjLT50eC0+ZGF0
YVswXTsKIAkJCW52ZWMtPnR4LT5wb3MgPSAxOwogCQkJLyogZGVsYXkgQUNLIGR1ZSB0byBB
UDIwIEhXIEJ1ZwotCQkJICAgZG8gbm90IHJlcGxhY2UgYnkgdXNsZWVwX3JhbmdlICovCisJ
CQkgKiBkbyBub3QgcmVwbGFjZSBieSB1c2xlZXBfcmFuZ2UKKwkJCSAqLwogCQkJdWRlbGF5
KDMzKTsKIAkJfSBlbHNlIGlmIChzdGF0dXMgPT0gKEkyQ19TTF9JUlEpKSB7CiAJCQludmVj
LT5yeC0+ZGF0YVsxXSA9IHJlY2VpdmVkOwotLSAKMi40My4wCgo=

--------------XnJugc9jmN0okhNKc0vaSIQa--
