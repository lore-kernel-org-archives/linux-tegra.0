Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888CD367F2F
	for <linux-tegra@vger.kernel.org>; Thu, 30 Jul 2026 03:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785381266; cv=pass; b=Uxyp+OUSrie1zhrlw4zArmgwXldplsM8dueyzNHTjnSMuhxX+iyip/0gD822QLOiOYNxQ29XLMuLSRpJ3xMs0++qPSrUJF68M0Z2pmn4KLVi63FMoVnuxD6ceuP11nEyPYCHrQdmGdUB1eTLxAc7LQkAJYRpuv6wIRbAMoaWDW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785381266; c=relaxed/simple;
	bh=FnkdHShbytKEyqeUh4U+lDiT3IQUDNQw7eVmWJAhaNM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Ohd57hSqdjXvO1RAyRBEAEdMEU0F2OYCgClMQnl8FmvkZyCilpJxKwtkz/NbLoD9rKj9DJcMO31XnuGqUXcuZueTotMXuK+4uHcjBhuW8ewCUOXIpCVlsWvAckzGn87G63LQUZXMDxW3tiPz01ciMDjYvG9bkR8RdAfGfNPYUX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPmMcE7m; arc=pass smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPmMcE7m"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-848479c9bd5so1421493b3a.3
        for <linux-tegra@vger.kernel.org>; Wed, 29 Jul 2026 20:14:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785381265; cv=none;
        d=google.com; s=arc-20260327;
        b=F+rsyNQvzoED+MolATaTYtUX9jYCSKE4R/8PcZ3NFN6twRvRzPLAYYngkRovjo6LyP
         hLcvExKPnP6/1IEqafUXpqG+t5MMBz1XPZPI6kNVazADLrmXiw3yoCALYDLTR48r4ypw
         G1HLk2wR25dxBNCSHQ5pw4RphIsq5hWxeHbrwAmXqProAfGCW9yDRiXLvADgJY757WSy
         2jmw1yCK0zMXqPY8ZM87Uf2diVMUSGYJa2AOufCcPotyomG/kq23w8x40ky+/N1b5Yqa
         JfDuAL+6jajNW67bk92tbfcnB91NyShcs6fba5cIPz5KpNLoicCu5MBXLmxPbfCwBpIw
         lyJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=FnkdHShbytKEyqeUh4U+lDiT3IQUDNQw7eVmWJAhaNM=;
        fh=1XlfpNarkkJQk4kKBpJL7vQhQlloyWIXk0cODU5fPJU=;
        b=JhlMay0AkTCYwKPVTIxxaNOgUDUBKI97FgTOL1GrSqU2O95l1tXO5AomdaA2mfUWPv
         ac92rXqDZha/fNmtPlicdcRDm4I8jfzbUh39MDTWoPrdY4d7p1RcZT2qRo33p0Ua4q8E
         C1E2nHHZm88f1OYiItj9xe1hEX34aZcIvb8wGHP/wD7hX4fJWGsHd9gO42emp/Z3E72H
         L6+JYoIabA2uwsbTu5Y6XcZT6Q6MB4apSe+62FP3gc7vAwb7MusMYefS/1wuoulExKaG
         ETVMscu2TeqqehVj8kSN9D0XHw2suY2epxmh/JA6UHsAgFg/xay04SbccuROIH/dEC7h
         GCJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785381265; x=1785986065; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FnkdHShbytKEyqeUh4U+lDiT3IQUDNQw7eVmWJAhaNM=;
        b=bPmMcE7m7VcCWRZ72/QwoL/7RSAU1rPQfPMdeD8IOkrH7F8PgLVlm9TCvFEulZ+oht
         6/mFSBKBzDSOs182ow2rEk7C5WItcH/q1bd6edpd82xGfN2JT2kze64PgAtBB3jC6QAs
         pfXuDxQUneL9IwFBGf/fkVQuFhYm9O2bzjiUy60Vv086+L7RCTxmaaaW65W15XLvCHv3
         zsFZuRDpUqc4wYq7jc/K8+y5P5cEIRk8bkxt3TcgzQsPenR45E+4H7UzzMSp0pCFEgMk
         n/RhQi4jAM98Cn1doV/Y+WTB6XCG/n0CkQXrLRguFPhHum/EPaOYm1J8XKZNM/gBOTrI
         128g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785381265; x=1785986065;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FnkdHShbytKEyqeUh4U+lDiT3IQUDNQw7eVmWJAhaNM=;
        b=a84RWTHRi23BiG43v53y7S5SNF3ccHs1u0zmOPm7hAbrZ2jCuiV9YrUZqrr0Vll7H6
         8bJ27VzD/IbJiBnOqKpIY8yZeTjwETopjKCZTK/S/529uCX/pgth25af53sT+8y5lh5s
         3XDEeQT0FRfPh4GX2EG6bFn6OcJcH7O0mdivTPjx94BtB47gAFSFDnKWTZT9BhqU2e4Q
         /+wOPympwtpDhLHNG3IH4V/C1E4CWTgNrBZWOAxqOURsE0wylErJhV43JtIz6BUDqzRl
         uCLh9LecotRY96flHosudq91Tjiw0XgcADzTPRLWBuyZe06qBv8WhsJPXq1P9jFP1ozX
         lKKQ==
X-Forwarded-Encrypted: i=1; AHgh+RoAC1c2kmdC1So5GVmALJrPFvKsJ5xzrpXoFqekCFiBfSFWJVr2Vdogd+UA4PwmvU3mMuUAkA88Aj14dA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwnVOaSlB6oaj2xQEqgXTja+CKimNY0TAz+MjZ2Eaba+8lniOac
	DQhE12W9OUKYPOMRcw4+WSkK9AG/p8AwLX9CwjkFRNgQUrpLkF+MBJG5cUipVkLY/GVN/1WY2UP
	KBYfqgS45ZONnUJEfqDB4CahQb9WylhJVnbufxGU=
X-Gm-Gg: AR+sD12+OJRXrSq6xN4br4jsDnGCiEPZx/H0QtvRMl9axLGWjjURyCv9FOtK/TGaE/Z
	W2Uyj3A3DBmpp27DFPZGc0VBhiORpBxO01fI/EYzSlF0bfv9eCmZG3aDc7ODLLIki2eYh+484Bd
	BO7Ad6TNS/e3Dp/lxjKtGw//bytv7GxS9YRI7pE3OT/JaOg8coHYJDsjUfLLw30y7YHRHCfA2Wf
	/vxM3c5GfpxKG48JpKdp2uGEKyLQJGMphil0yt0o07EigtACdA4+O6dMZhfN4/3ap88XtJoo1iD
	TTT0iMMaf+CtNP5Os67jJIhYmlYKISGY6uSHg/cdSviE+w==
X-Received: by 2002:aa7:88c7:0:b0:848:760e:eb76 with SMTP id
 d2e1a72fcca58-84ebc432c34mr874255b3a.61.1785381264870; Wed, 29 Jul 2026
 20:14:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Lucas Jeffrey <luquijeffrey@gmail.com>
Date: Thu, 30 Jul 2026 00:14:12 -0300
X-Gm-Features: AUfX_mzgo-n0WvRUKHYtMALllU4tDvmclTwJnj2TYqQ8OSnyTk3mkOF0zJDwevk
Message-ID: <CAObkL7P+PnkEBpav6AVEPTyjiWsoOEBobUT2hrR=fay23FyO6w@mail.gmail.com>
Subject: [RFC] staging: nvec: possible missing bounds check in nvec_power_bat
 response handling
To: Marc Dietrich <marvin24@gmx.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello Marc, Greg,
While reviewing drivers/staging/nvec/nvec_power.c I noticed that the
battery response handler uses the length field from struct
bat_response without validating it against the destination buffer
size:
nvec_power.c between lines 120 and 220:

static int nvec_power_bat_notifier(struct notifier_block *nb,
unsigned long event_type, void *data)
{
struct nvec_power *power =
container_of(nb, struct nvec_power, notifier);
struct bat_response *res = data;
(...)

switch (res->sub_type) { (...)
case TYPE:
memcpy(power->bat_type, &res->plc, res->length - 2); //res->length is
never validated that is in a valid range, //according to the plc field
in the bat_response struct it should be smaller than 30 (...)

}

return NOTIFY_STOP;
}


The same patterns patterns exist for MANUFACTURER and MODEL.
My understanding is that res->length comes from the NVEC embedded
controller response. If a malformed response contains a length larger
than the destination buffer, this could result in an out-of-bounds
write.
I would like to confirm whether the NVEC protocol guarantees these
length values, or whether the driver should validate them before
copying.

Thanks, Lucas
