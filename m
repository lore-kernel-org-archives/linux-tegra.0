Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8017A217304
	for <linux-tegra@vger.kernel.org>; Wed,  2 Oct 2024 20:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727901547; cv=none; b=f+wsaS7W5F3rmHMUiNu+9p7YWzl9Gt8XmfD5wGZHqWHfoHIimyrfTE7va7J8/9oQ5B42ymfBVvq+Kl3yA4KW2I0zgMpO+kEEWTj+IWS62yVBkSUrLs2Hsn4vGvAuSzEe9G8xwUo7vJDCt8GpQxXqNVJvs1suNOUlmiaTofjh2jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727901547; c=relaxed/simple;
	bh=DNL795QT+5z9dTnnNTLOOaupqBSSBh4UNsoHd+L54qs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WhL1oeFMKeQ/zS/rTJ3TslzLJk+2rwKEmHnMAY0tET6954gtlPkoWVUklYUyKXfatDn26qZe+uMiP5CaBB3wJjEytlJiyBJNWFUUNjOygil2dZVnND1aIBNXiLVjbimvw+rw49axyRsQFiljeJXi7lfaSgDC6pGq7e8e7dvWQEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NWhquqYy; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NWhquqYy"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-20b9b35c7c7so1107965ad.1
        for <linux-tegra@vger.kernel.org>; Wed, 02 Oct 2024 13:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727901544; x=1728506344; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWetV44sYoIfr8WFLB8kLqzkS6u8btS/1XZjRCqxU4w=;
        b=NWhquqYypdU193QMMOnyrAu+6Q7J4iVP4TJOr0r3MuBcsB1frV4YZV4x1XHAnKu1QR
         6lUlBRAYjfJ4XnAfGvN07/fgGg4rqNeXLcFhEldlJ7bepDU7BnTAVpObieiuKe87mty0
         cTt+T6K9lj5V0wCrClmCJesysEcN/j30m/MzlwBCAY8CIz7xaILQoMKS1xeM/4MCqlEp
         ys68V/cG3Jhks5qsArCn0R+pe7+rbFrG9cvbQwyYIsuMrXlzaYwxNClPv2bkdPzlEepV
         8b3zQX5AnotSH6HMSbfbUENEP8nDtVGkktNkitlDyqap1KRRxpZ2Pfc5d52AiHOiGyr5
         QWAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727901544; x=1728506344;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWetV44sYoIfr8WFLB8kLqzkS6u8btS/1XZjRCqxU4w=;
        b=NYhugj0e/WUtPPtxMPUuxDa7Idv3qXQtlGV0DoAU7KKJ32tReha8goLZ+2kDCnFnXc
         csUC+kk8R9NtRySavDYnG7eUTc6tasrVeyoJymMoQBz/tNrOzpUvnpLW6Tge2Zoe0CST
         h+hpVxWkCQ7BTCqExIO7JW5HrsICf6oWPyTq0sGpsGFmtRtIKogYQnM0vZVHwnRI+le+
         Q0aA/ggamwuwh5SoGGm/ESpeQ28z6lDs6icXVTKLSEy/hwdytYzRqk5oh2i+91AG0GJj
         rANXTTi2OYEO2VadD0s20Bp9pqaU7Q6TVp6IyRotZVIfB6hWUjsPdFCmxG/sDQ3BTru+
         GPEA==
X-Forwarded-Encrypted: i=1; AJvYcCVtR+T2g3NxnVWyFW6ZyGuQ6cG0Y3r8wRC+stEUDdRkQgWCY7+n1BsFU7Fr1pdMH7c70DiEno9nFYkHwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaTGf5+75+nfC3vbHF/Ued9eGPMzvw4X0dRdLqp1B57eSP+11+
	5xhU/FcYfzk7gNJjFNMGAdclrKhZdTZlluUgu5ZvrmsvP5ME5g34NAzsAR/KQ6RMAYJex233GQ9
	3yItVxdEnYkMMOAMLljTUU6T7QklXxcAfbdgA
X-Google-Smtp-Source: AGHT+IFhE1Kcw49fp32iK8EJ08bwBvxPENFJ/y+V3smbFXnYrUNi58Zv3vQegqoOoa07QG+mc3zJE7gzGCPuyVEk1Mc=
X-Received: by 2002:a17:90b:1195:b0:2e0:8740:26d0 with SMTP id
 98e67ed59e1d1-2e18451d6a6mr5558658a91.2.1727901543372; Wed, 02 Oct 2024
 13:39:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240910130019.35081-1-jonathanh@nvidia.com> <2024091152-impound-salt-c748@gregkh>
 <d89c89f8-0036-44a4-8ffa-ea89ed576a9f@nvidia.com> <2024091627-online-favored-7a9f@gregkh>
 <b1b67db0-3b9c-4d96-a119-fe3fcf51b6e3@nvidia.com>
In-Reply-To: <b1b67db0-3b9c-4d96-a119-fe3fcf51b6e3@nvidia.com>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 2 Oct 2024 13:38:23 -0700
Message-ID: <CAGETcx8E9FddpwMO4+oqeEc0RVMLbUOs2m+=B900xzrLvEkSXw@mail.gmail.com>
Subject: Re: [PATCH] driver core: Don't try to create links if they are not needed
To: Jon Hunter <jonathanh@nvidia.com>, 
	=?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 2, 2024 at 11:30=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
> Hi Greg,
>
> On 16/09/2024 18:49, Greg Kroah-Hartman wrote:
> > On Mon, Sep 16, 2024 at 03:50:34PM +0100, Jon Hunter wrote:
> >>
> >> On 11/09/2024 15:32, Greg Kroah-Hartman wrote:
> >>> On Tue, Sep 10, 2024 at 02:00:19PM +0100, Jon Hunter wrote:
> >>>> The following error messages are observed on boot with the Tegra234
> >>>> Jetson AGX Orin board ...
> >>>>
> >>>>    tegra-xusb-padctl 3520000.padctl: Failed to create device link (0=
x180)
> >>>>      with 1-0008
> >>>>    tegra-xusb-padctl 3520000.padctl: Failed to create device link (0=
x180)
> >>>>      with 1-0008
> >>>>    tegra-xusb-padctl 3520000.padctl: Failed to create device link (0=
x180)
> >>>>      with 1-0008
> >>>>
> >>>> In the above case, device_link_add() intentionally returns NULL beca=
use
> >>>> these are SYNC_STATE_ONLY links and the device is already probed.
> >>>> Therefore, the above messages are not actually errors. Fix this by
> >>>> replicating the test from device_link_add() in the function
> >>>> fw_devlink_create_devlink() and don't call device_link_add() if ther=
e
> >>>> are no links to create.
> >>>>
> >>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> >>>
> >>> What commit id does this fix?
> >>
> >>
> >> Hard to say exactly. The above error message was first added with comm=
it
> >> 3fb16866b51d ("driver core: fw_devlink: Make cycle detection more robu=
st")
> >> but at this time we did not have the support in place for Tegra234 USB=
. I am
> >> guessing we first started seeing this when I enabled support for the t=
ype-c
> >> controller in commit 16744314ee57 ("arm64: tegra: Populate USB Type-C
> >> Controller for Jetson AGX Orin"). I can confirm if that is helpful?
> >>
> >
> > That helps, I'll look at this after -rc1 is out, thanks!
>
>
> Let me know if there is anything else I can answer on this one.

Hi Jon,

See this.
https://lore.kernel.org/all/c622df86-0372-450e-b3dd-ab93cd051d6f@notapiano/

Ignore my point 1. My point 2 still stands. I got busy and forgot to
reply to N=C3=ADcolas.

I'm fine with either one of your patches as long as we define a
"useless link" function and use it in all the places.

Thanks,
Saravana
