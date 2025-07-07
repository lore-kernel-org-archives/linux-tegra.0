Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D6D262FF5;
	Mon,  7 Jul 2025 10:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751883620; cv=none; b=iGksOVgHWTs8lR1wxjeb5gVQ5aWyddATC55MrgKxQkTARwcPh26wq67d4CREu+gA/ESzI/EY7WzkXcrwT6Eg9//bIIQW2Yelo22V2mM8CNW3sQa72FhOfm/h0c6+pfkA9QSmj8vaKYIx31ZlwSwWMZEZvsRN3G/3hhsjrTK6LIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751883620; c=relaxed/simple;
	bh=ve/2c2cHaqziQTzdN/60d6vdGvVGuiLOGnO6hQBtULs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mpqpdAgHxI8lljXIaoRwYihC3H24km7YEW9tKgfCjApDeXjECfQxDzjSzC8EVMwpq2ps69IGWLRvZ7Qq+038gn5IFenhklCIN9Vg1+H9Cxj0aMn3YR+hnkPW7DhGdHXjLEaexaWJuUnG6TWWQ2e1wT69YbTPCVZ9xtMkCqLNVyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OkScajRU; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OkScajRU"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4537fdec39fso7643835e9.0;
        Mon, 07 Jul 2025 03:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751883617; x=1752488417; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IgngQ5cwyLNamE6ancq51PnK6HtXgBQEA02M7sZW0+g=;
        b=OkScajRUsTArBvbn6zR6h93nDlCfq4Mq/SFFuryVf522DS7uRY4pcKhl+nU/BHhBRn
         7HAZzM9jNAglkzNBW9FfPRVqXLvcZX09kzQCO0Zys2yGVsnL20s3XJ3yxlHrXTWY7xlD
         DeJwa5GuWwB5jm8bHgsVYlcO4vzlzL5qi0YWLn9UZDsEXWjpCwsZWRs3avoDhC7+blds
         8ANnWDCG98a/Papg9MPAaYGNDMglJbHaPeLa7Xen7XYmIP17uZ6Qjc9Id2xtJl34X2Z1
         XXSR9zp5i28VyiXUbemtwPbE9DMnY+A7pTTDekksIhVw/VcM8Y8VAHq8TWqIUVzC/IWL
         yMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751883617; x=1752488417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IgngQ5cwyLNamE6ancq51PnK6HtXgBQEA02M7sZW0+g=;
        b=iBNLS6NCEQDmgG/zXOkMVehvJv1aadI0GYNAEfGG3r/i/8EihbGj2TsSt0TRXG3pnj
         3/tq83E/uTYGlbRYBlgsYDhd4sj0r3WDuhtuH5iaYCWv7s0EpAITJ2qjOP8KkXO5271h
         cGJsP0cA/Q/hB4vfe2EjaHmBPQH86QHB0qk9yWgId5r4COqXYGDJ/OlmtH2i6ebzN+V8
         FjVfu8a7AHzBMKkPR7kX8fmEZR2fwlPEMshUqM6NVv7wN8lOWY5zUts23FThtOLZ+dyo
         8rTYljnGF6AEXoWfn8XsW9HLxX1laftXXROQ3WMdaIX6dGCI0siws0mvAHSqNP6ggDBQ
         p4wA==
X-Forwarded-Encrypted: i=1; AJvYcCWRigndUbdRrFLxmkP6H6/oTQk218Zgb8V+gXMVM2jkyCxKpbYQoKjTTXcFW2Xrr80ONCeTbsuEy/7e@vger.kernel.org, AJvYcCXV3UP7rn1Ao+uJiPm8IYrStQEQGHjZSeIcn0wf3YcmLWy3xTV6tOqAlbRiRMvsTEDSNG6N+HwJ6xA6vVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFCNWLGrGyXAorEW3mAEu2LUsl+YeLDvTUP0iizUBBW0MonCqm
	VSKu40Aj3tFJ/glC1yO4A/JblJ5uF2pfoKZi9dEVxsI57+JmcXRzCiTT
X-Gm-Gg: ASbGnctcqNr2kppq9U3QM2oH0NaW1ikZW6vlFFJG7IDwE2KU8WfMwVxTEzJNh9tq6f4
	ecfi+AknoH1IcRR41lX2rmwXtHaXxVADgtba74ewyqmoIqtPKwb5Kfi8OgSLQAt/XDW5JbVZIr6
	EAf71tacuPaG74AoMgxBNpVP0JtYArLchbCuAfIREmEC1Rz5cvGuVGwVGOaZBfRlagBUN51tGoi
	GyBDtP14wSNWsdKfatTXiUYd7O0ltttYy0GtiQ8897ZDvXjFgtGl1sHlqwGBydeZNrJGGOl8X3i
	wRgyy8ruGtR3lHpZEkIYd23B95v1udePG5Dq6QqvJ+3+31+6y3y0PF2B2Y7zt8x8UStilqkdmRT
	wW93A1tzsMoHcV0eK6T2h0zQ3sRURQMgTemx8x9jnEZe+Qp3QBSDTyA==
X-Google-Smtp-Source: AGHT+IFlwyq1JL36vI4kEVmS6ptNKCLnT4KuHGJOKhnlhY6M+0BNbx8hFlwNIUih31YBk17w2hDEGQ==
X-Received: by 2002:a05:600c:3153:b0:440:6a79:6df0 with SMTP id 5b1f17b1804b1-454b315fee2mr86803105e9.22.1751883616214;
        Mon, 07 Jul 2025 03:20:16 -0700 (PDT)
Received: from localhost (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-454a9969a8bsm137399495e9.2.2025.07.07.03.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 03:20:15 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 02/11] dt-bindings: mailbox: tegra-hsp: Bump number of shared interrupts
Date: Mon,  7 Jul 2025 12:20:05 +0200
Message-ID: <175188357610.1321171.12415641034815981953.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250506133118.1011777-3-thierry.reding@gmail.com>
References: <20250506133118.1011777-1-thierry.reding@gmail.com> <20250506133118.1011777-3-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Tue, 06 May 2025 15:31:09 +0200, Thierry Reding wrote:
> It turns out that some instances of the HSP block on Tegra264 can have
> up to 16 shared interrupts, so bump the maximum number of allowed
> interrupts.
> 
> 

Applied, thanks!

[02/11] dt-bindings: mailbox: tegra-hsp: Bump number of shared interrupts
        commit: b6be35ae29a38431e554d3ad35ec552058058ae6

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
